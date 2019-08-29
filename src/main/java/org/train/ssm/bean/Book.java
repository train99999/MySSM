package org.train.ssm.bean;

import java.io.Serializable;

public class Book  implements Serializable {
    private Integer bookId;
    private String bookName;
    private Float bookPrice;
    private String bookPublisher;
    private String bookAuthor;

    public Book() {

    }

    public Book(Integer bookId, String bookName, Float bookPrice, String bookPublisher, String bookAuthor) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookPrice = bookPrice;
        this.bookPublisher = bookPublisher;
        this.bookAuthor = bookAuthor;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Float getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Float bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookPublisher() {
        return bookPublisher;
    }

    public void setBookPublisher(String bookPublisher) {
        this.bookPublisher = bookPublisher;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookPrice=" + bookPrice +
                ", bookPublisher='" + bookPublisher + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                '}';
    }
}
