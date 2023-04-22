package com.javarush.jira.profile.web;

import com.javarush.jira.AbstractControllerTest;
import com.javarush.jira.profile.internal.ProfileRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static com.javarush.jira.login.internal.web.UserTestData.USER_MATCHER;
import static com.javarush.jira.login.internal.web.UserTestData.user;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


class ProfileRestControllerTest extends AbstractControllerTest {
    private static final String REST_URL = ProfileRestController.REST_URL + "/";

    @Autowired
    private ProfileRepository profileRepository;

    @Test
    void get() throws Exception {
//        perform(MockMvcRequestBuilders.get(REST_URL))
//                .andExpect(status().isOk())
//                .andDo(print())
//                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
//                .andExpect(USER_MATCHER.contentJson(user));
    }

    @Test
    void update() {
    }
}