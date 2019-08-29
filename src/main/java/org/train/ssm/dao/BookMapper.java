package org.train.ssm.dao;

import org.train.ssm.bean.Book;
import java.util.List;

public interface BookMapper {
    //查询所有书籍
    List<Book> findBooks();
    //添加书籍
    Boolean addBook(Book book);
    //查询指定书籍
    List<Book> findBooksSpe(String string);
    //更新书籍
    Boolean updateBook(Book book);

    Boolean deleteBook(Integer bookId);

    Book findBookById(Integer integer);
}
