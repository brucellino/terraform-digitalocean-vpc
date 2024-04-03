package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestEnvironment(t *testing.T) {
	assert.NotNil(t, os.Getenv("VAULT_TOKEN"))
}

func TestVPCAndProject(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/simple",
		PlanFilePath: "test.tfplan",
		Upgrade:      true,
		Vars: map[string]interface{}{
			"vpc_name":     "vpc-test" + os.Getenv("GITHUB_RUN_ID"),
			"project_name": "ci-" + os.Getenv("GITHUB_RUN_ID"),
		},
	})

	defer terraform.Destroy(t, terraformOptions)
	// assert that project is not default
	_, errP := terraform.InitAndPlanE(t, terraformOptions)
	assert.Nil(t, errP)

	_, errI := terraform.ApplyE(t, terraformOptions)
	assert.Nil(t, errI)

}
