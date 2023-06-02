package test

import (
	"context"
	"fmt"
	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/resources/armresources"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

var (
	resourceGroupClient *armresources.ResourceGroupsClient
)

var (
	resourcesClientFactory *armresources.ClientFactory
)

func TestFirstNetworkModule(t *testing.T) {
	t.Parallel()

	uniqueID := random.UniqueId()
	rg_name := fmt.Sprintf("ashvets_%s", uniqueID)

	tfOptions := &terraform.Options{
		TerraformDir: ".",
		Vars: map[string]interface{}{
			"first_network_rg_name":     rg_name,
			"first_network_name":        "fnwnm",
			"first_network_rg_location": "West Europe",
		},
	}

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
	_, err := terraform.RunTerraformCommandAndGetStdoutE(
		t, tfOptions, terraform.FormatArgs(tfOptions, "apply", "-auto-approve")...,
	)

	if err != nil {
		t.Fatal(err)
	}
	cred, err := azidentity.NewDefaultAzureCredential(nil)
	if err != nil {
		t.Fatal(err)
	}
	resourcesClientFactory, err = armresources.NewClientFactory("2f5675ee-7089-4537-b0be-07040f2c1194", cred, nil)
	if err != nil {
		t.Fatal(err)
	}
	resourceGroupClient = resourcesClientFactory.NewResourceGroupsClient()
	ctx := context.Background()

	boolResp, err := resourceGroupClient.CheckExistence(ctx, rg_name, nil)
	if err != nil {
		t.Fatal(err)
	}

	if boolResp.Success != true {
		t.Fatal(err)
	}
}
