/*
 * User Management API
 *
 * API для управления пользователями
 *
 * API version: 1.0.0
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package openapi

type UserUpdate struct {
	Name string `json:"name,omitempty"`

	Email string `json:"email,omitempty"`

	Friends []int32 `json:"friends,omitempty"`
}
