package com.vicmac.springstarter

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SpringbootAwsSecretsStarterApplication

fun main(args: Array<String>) {
	runApplication<SpringbootAwsSecretsStarterApplication>(*args)
}
