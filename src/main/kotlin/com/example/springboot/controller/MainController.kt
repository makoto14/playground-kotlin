package com.example.springboot.controller

import com.example.springboot.entity.User
import jakarta.websocket.server.PathParam
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class MainController {

    @GetMapping("/")
    fun getUser() = User("makoto", 10)


    @GetMapping("/user")
    fun getUserByRequestParam(@RequestParam("name") name: String): User {
        return User(name, 10)
    }

    @GetMapping("/user/{name}")
    fun getUserByPathParam(@PathVariable("name") name: String): User {
        return User(name, 10)
    }

}
