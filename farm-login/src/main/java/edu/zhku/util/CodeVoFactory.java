package edu.zhku.util;

import edu.zhku.constant.Code;
import edu.zhku.vo.CodeVo;

/**
 * @author chujian
 * @ClassName CodeVoFactory
 * @Description 功能描述
 * @date 2019/2/14 9:57
 */
public class CodeVoFactory  {

    public static CodeVo getVo(Code code) {

        CodeVo vo = new CodeVo();

        vo.setCode(code.getCode());
        vo.setTip(code.getTip());

        return vo;
    }
}
    