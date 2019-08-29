package org.train.ssm.bean;

import com.github.pagehelper.PageInfo;
import org.train.ssm.controller.BookController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Msg {
    private int code;
    private String msg;
    private Map<String,Object> extend = new HashMap<>();
    private PageInfo pageInfo;
    private List<Book> books;

    public static Msg success(List<Book> books){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        result.setBooks(books);
        return result;
    }

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }
    public static Msg success(PageInfo pageInfo){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        result.setPageInfo(pageInfo);
        return result;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }

    public Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }
    @Override
    public String toString() {
        return "Msg{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", extend=" + extend +
                ", pageInfo=" + pageInfo +
                ", books=" + books +
                '}';
    }
}
