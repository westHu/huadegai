package com.xkeshi.demo.services.impl;

import com.xkeshi.core.test.AbstractRollbackTest;
import com.xkeshi.demo.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.annotations.Test;

public class TestServiceImplTest extends AbstractRollbackTest {

    @Autowired
    private TestService testService;

    @Test
    public void testQueryResult() throws Exception {

    }

    @Test
    public void testFindResult() throws Exception {

    }

}