package com.vicmac.springstarter.controller

import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController

@RestController
class EchoController {

    @PostMapping(path = ["/echo"])
    fun echo(@RequestBody requestBody: String) : String {

        return requestBody.toUpperCase()

    }

}