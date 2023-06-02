package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestFirstNetworkModule(t *testing.T) {
	t.Parallel()

	tfOptions := &terraform.Options{
		TerraformDir: ".",
		Vars: map[string]interface{}{
			"first_network_rg_name":     "fnwrgnm",
			"first_network_rg_location": "West Europe",
			"first_network_name":        "fnwnm",
		},
	}
	terraform.Init(t, tfOptions)
	planJSON, err := terraform.RunTerraformCommandAndGetStdoutE(
		t, tfOptions, terraform.FormatArgs(tfOptions, "plan", "-json")...,
	)

	if err != nil {
		t.Fatal(err)
	}

	countOfExpectedString := strings.Count(planJSON, "Plan: 2 to add")

	if countOfExpectedString < 1 {
		t.Fatal("Wrong number of resources to add")
	}
}
