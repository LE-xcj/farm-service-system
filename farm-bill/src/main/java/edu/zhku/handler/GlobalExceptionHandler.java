package edu.zhku.handler;

import edu.zhku.vo.CodeVo;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * @author chujian
 * @ClassName GlobalExceptionHandler
 * @Description 功能描述
 * @date 2019/2/17 20:08
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value=Exception.class)
    public CodeVo allExceptionHandler(HttpServletRequest request, Exception e) {

        CodeVo vo = new CodeVo();
        vo.setCode(500);
        vo.setTip(e.getMessage());

        return vo;
    }

}
    