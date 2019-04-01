package com.hugo.services.impl;

import com.hugo.services.TestService;
import org.springframework.stereotype.Service;

/**
 * @ClassName: TestService
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/1$ 15:21$
 * @Version: 1.0
 */
@Service
class TestServiceImpl implements TestService {
    @Override
    public String test() {
        return "test";
    }
}
