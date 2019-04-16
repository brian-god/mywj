package com.hugo.controller;

import com.hugo.entity.Option;
import com.hugo.entity.Subject;
import com.hugo.entity.User;
import com.hugo.services.OptionService;
import com.hugo.utils.MywjUtils;
import com.hugo.utils.QAResult;
import com.hugo.utils.page.PageHelper;
import com.hugo.utils.page.childvo.OptionPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by lxs on 2019/4/16.
 */
@Controller
public class OptionController {

    @Autowired
    private OptionService optionService;

    /**
     * 按规则查询
     * @param optionPage
     * @return
     */
    @RequestMapping("getOptions")
    @ResponseBody
    public PageHelper<Option>  getOptions(OptionPage optionPage){
        PageHelper<Option> pageHelper = new PageHelper<Option>();
        pageHelper.setTotal(optionService.getOptionNum(optionPage));
        pageHelper.setRows(optionService.getOptions(optionPage));
        return pageHelper;
    }


}
