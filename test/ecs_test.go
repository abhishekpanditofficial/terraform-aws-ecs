package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformEcsExample(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/ecs",
		Vars: map[string]interface{}{
			"ecs_name":"test",
		},
	})

	terraform.InitAndApply(t, terraformOptions)

	defer terraform.Destroy(t, terraformOptions)

	// ECR Test
	ecs_cluster_name := terraform.Output(t, terraformOptions, "ecs_cluster_name")
	assert.Equal(t, "test", ecs_cluster_name)
}