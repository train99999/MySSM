package org.train.ssm.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.train.ssm.bean.Book;
import org.train.ssm.bean.Msg;
import org.train.ssm.service.BookService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    BookService bookService;

    //这个方法是展示所有书籍的方法
    @RequestMapping("/findBooks")
    @ResponseBody
    public Msg findBooks(@RequestParam(value = "number",defaultValue = "1") Integer number){
        PageHelper.startPage(number, 5);
        List<Book> books = bookService.findBooks();
        PageInfo page = new PageInfo(books);
        Msg info = Msg.success(page).add("info", books);
        System.out.println(info);
        return Msg.success(page).add("info", books);
    }

 /*   @RequestMapping:用来处理请求地址映射的注解可以用于类上或方法上，相当于父路径和子路径
 *    @ResponseBody:注解表示改方法的返回结果直接写入HTTP响应正文中
 *    @RequestBody:是将HTTP请求正文插入方法中，将请求体中的JSON字符串绑定到相应的bean上，当然，也可以将其分别绑定到对应的字符串上。
 * */
    //这个方法是添加书籍的方法
    @ResponseBody
    @RequestMapping(value="addBook",method = RequestMethod.POST)
    public Msg addBook(Book book){
         bookService.addBook(book);
        PageInfo pageInfo = new PageInfo();
        return Msg.success(pageInfo);
    }

    //这个方法是查询书籍的方法
    @ResponseBody
    @RequestMapping(value = "findBooksSpe")
    public Msg findBooksSpe(Book book){
        List<Book> booksSpe = bookService.findBooksSpe(book.getBookName());
        Msg success = Msg.success(booksSpe);
        if (booksSpe == null||booksSpe.size()==0){
            return Msg.fail();
        }
        return success;
    }
    //这个是更新书籍方法
    @RequestMapping(value = "updateBook")
    @ResponseBody
    public Msg updateBook(Book book){

        Boolean aBoolean = bookService.updateBook(book);

        if (aBoolean) {
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }
    //这个是删除书籍方法
    @RequestMapping(value = "deleteBook")
    @ResponseBody
    public Msg deleteBook(Book book){
        Boolean aBoolean = bookService.deleteBook(book.getBookId());
        if(aBoolean){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }
    //这个方法是根据ID查询的方法
    public Book findBookById(Integer integer){
        Book book = bookService.findBookById(integer);
        return book;
    }
}
