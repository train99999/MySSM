package org.train.ssm.test;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.train.ssm.bean.Book;
import org.train.ssm.dao.BookMapper;

import java.io.IOException;
import java.io.InputStream;

public class AddTest {
    public static void main(String[] args) throws IOException {
        InputStream in = Resources.getResourceAsStream("SqlMapConfig2.xml");
        SqlSessionFactoryBuilder factoryBean =new SqlSessionFactoryBuilder();
        SqlSessionFactory build = factoryBean.build(in);
        SqlSession sqlSession = build.openSession();
        BookMapper mapper = sqlSession.getMapper(BookMapper.class);
        Book book1 = new Book("三国演义",8888f,"广东教育出版社","罗贯中");
        Book book2 = new Book("麦田里的守望者",7777f,"江苏教育出版社","塞林格");
        Book book3 = new Book("Effective java",6666f,"浙江教育出版社","Joshua Bloch");
        Book book4 = new Book("资本论",5555f,"北京教育出版社","马克思");
        for(int i=0;i<1000;i++){
            if(i%4==0){
                mapper.addBook(book1);
            }else if(i%4==1){
                mapper.addBook(book4);
            }else if(i%4==2){
                mapper.addBook(book3);
            }else {
                mapper.addBook(book2);
            }
        }
        sqlSession.commit();

    }
}
