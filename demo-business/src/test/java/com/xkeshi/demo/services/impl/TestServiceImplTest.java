package com.xkeshi.demo.services.impl;

import com.xkeshi.core.test.AbstractRollbackTest;
import com.xkeshi.demo.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.annotations.Test;

public class TestServiceImplTest extends AbstractRollbackTest {

    @Autowired
    private UserService testService;

    @Test
    public void testQueryResult() throws Exception {

    }

    @Test
    public void testFindResult() throws Exception {

    }

}