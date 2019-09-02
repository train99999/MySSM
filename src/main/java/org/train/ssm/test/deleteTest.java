package org.train.ssm.test;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.train.ssm.dao.BookMapper;

import java.io.IOException;
import java.io.InputStream;

public class deleteTest {
    public static void main(String[] args) throws IOException {
        int i=201;
        int j=499;
        InputStream in = Resources.getResourceAsStream("SqlMapConfig2.xml");
        SqlSessionFactoryBuilder factoryBean =new SqlSessionFactoryBuilder();
        SqlSessionFactory build = factoryBean.build(in);
        SqlSession sqlSession = build.openSession();
        BookMapper mapper = sqlSession.getMapper(BookMapper.class);
        while (j>=i){
            mapper.deleteBook(i);
            i++;
        }
        sqlSession.commit();
    }
}
