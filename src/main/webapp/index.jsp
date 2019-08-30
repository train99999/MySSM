<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="margin-left" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="margin-right" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <%-- 引入样式--%>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<h2 style="color: #eb9316; text-indent: 20px" >欢迎来到藏书阁</h2>

<div>
    <div class="col-md-4 col-md-offset-4">
        <button type="button" class="btn btn-primary" id="findBook">查询书籍</button>
        <button type="button" class="btn btn-success" id="addBook">添加书籍</button>
        <button type="button" class="btn btn-info" id="updateBook">修改书籍</button>
        <button type="button" class="btn btn-danger" id="deleteBook">删除书籍</button>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table" id="books_table">
            <thead>
            <tr>
                <th>编号</th>
                <th>书籍</th>
                <th>售价</th>
                <th>出版社</th>
                <th>作者</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>

<div class="row" >
        <div class="col-md-3 col-md-offset-4" id="navId"></div>
</div>
<div class="row">
        <div class="col-md-6 col-md-offset-4" id="infoId">
            <p class="text-info" style="font-size: 25px;color: maroon"></p>
        </div>
</div>

<div>
    <h4 style="background: #66afe9;text-align: center;font-size: 20px">↓↓↓查询出来的书籍显示在这里↓↓↓</h4>
    <table class="table table-hover" id="showBook">

    </table>
</div>

<%--这个是添加书籍模态框--%>
<div>
    <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">添加书籍</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">书籍名称</label>
                            <input type="text" class="form-control" id="recipient-name" name="bookName">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">书籍价格</label>
                            <input class="form-control" id="message-text" name="bookPrice"></input>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">书籍出版社</label>
                            <input class="form-control" id="message-text1" name="bookPublisher"></input>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">书籍作者</label>
                            <input class="form-control" id="message-text2" name="bookAuthor"></input>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="saveBook">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--这个是查询书籍模态框--%>
<div>
    <div class="modal fade" id="findModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >查询书籍</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">请您输入书籍名称</label>
                            <input type="text" class="form-control"  name="bookName" placeholder="请输入书籍关键字">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="findBookId">查询</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--这个是更新书籍模态框--%>
<div>
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >更新书籍</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">书籍编号</label>
                            <input type="text" class="form-control" name="bookId" placeholder="你要更改书的编号是多少">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">书籍名称</label>
                            <input type="text" class="form-control" name="bookName" placeholder="你要更新书籍的名称是什么">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">书籍价格</label>
                            <input class="form-control" name="bookPrice" placeholder="你要更新书籍的价格是多少">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">书籍出版社</label>
                            <input class="form-control"  name="bookPublisher" placeholder="你要更新书籍的出版社是什么">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">书籍作者</label>
                            <input class="form-control" name="bookAuthor" placeholder="你要更新的书籍作者是谁">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateBookId">更新</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--这个是删除模态框按钮--%>
<div>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >删除书籍</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">书籍编号</label>
                            <input type="text" class="form-control" name="bookId" placeholder="请输入你要删除书籍的编号是多少">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="deleteBookId">删除</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        alert("数据如果没有出来请耐心等待几秒")
    });
    $(function () {
        toPage(1);
    });
    function toPage(number) {
        $("#navId").empty();
        $.ajax({
            url:"findBooks",
            type:"GET",
            data:"number="+number,
            success:function (result) {
                findBooks(result);
                nav(result);
                info(result);
            }
        })
    }
    //这个方法是查询所有并且遍历出来的数据显示到页面上的
    function findBooks(result) {
        $('#books_table tbody').empty();
        //获取list集合
        var lists=result.extend.info;
        var tdBtn;
        //遍历集合
        $.each(lists,function (index,item) {
            var idTd = $("<td></td>").append(item.bookId);
            var nameTd = $("<td></td>").append(item.bookName);
            var priceTd = $("<td></td>").append(item.bookPrice);
            var publisherTd = $("<td></td>").append(item.bookPublisher);
            var authorTd = $("<td></td>").append(item.bookAuthor);
            $("<tr></tr>")
                .append(idTd).append(nameTd).append(priceTd).append(publisherTd).append(authorTd)
                .appendTo('#books_table tbody');
        })
    }
    //这个方法是用来显示分页条的
    function nav(result){
        $("#navId").empty();
        var pageInfo = result.extend.info;
        var ul = $("<ul></ul>").addClass("pagination");//给ul标签添加class的属性
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","http://localhost:8080/MySSM_war_exploded/"));//给li标签添加a标签,a标签设置属性
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        //如果没有上一页就禁用
        if(!result.pageInfo.hasPreviousPage){
            prePageLi.addClass("disabled")//因为没有上一页，所以禁止点击上一页
        }else{
            //给prePageLi超链接绑定单击事件
            prePageLi.click(function () {
                //pageNum表示当前页 -1就是返回上一页
               toPage(result.pageInfo.pageNum-1);

            firstPageLi.click(function () {
                toPage(1);
            });
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (!result.pageInfo.hasNextPage) {
            nextPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                toPage(result.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                toPage(result.pageInfo.pages);
            });
        }
        //添加首页标签和上一页标签
        ul.append(firstPageLi).append(prePageLi);

        $.each(result.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                toPage(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页
        ul.append(nextPageLi).append(lastPageLi);
        // 把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#navId");
    }
    //这个方法是用来显示分页信息的
    function info(result) {
        var infoid=$("#infoId p");
        infoid.empty();
        infoid.append("当前"+result.pageInfo.pageNum+"页，总共搜索到"+result.pageInfo.pages+"页，"+result.pageInfo.total+"条数据")
    }
    //这个方法是用来显示出查询的书籍的
    function findBooksSpe(result){
        $("#showBook").empty();
        var var1 = result.books;
        $.each(var1,function (index,item) {
            $("#findBook")
            var trShow = $("<tr></tr>");
            $("<td></td>").append(item.bookId).appendTo(trShow);
            $("<td></td>").append(item.bookName).appendTo(trShow);
            $("<td></td>").append(item.bookPrice).appendTo(trShow);
            $("<td></td>").append(item.bookPublisher).appendTo(trShow);
            $("<td></td>").append(item.bookAuthor).appendTo(trShow);
            $("#showBook").append(trShow);
        });
    }
    //这个是点击添加书籍按钮时弹出模态框单击事件
    $("#addBook").click(function () {
        $("#AddModal").modal({
            backdrop:"static"
        });
    });
    //这个是点击查询书籍按钮是弹出模态框的单击事件
    $("#findBook").click(function () {
        $("#findModal form")[0].reset();
        $("#findModal").modal({
            backdrop:"static"
        });
    });
    //这个是点击修改书籍按钮时弹出的模态框的单击事件
    $("#updateBook").click(function () {
        $("#updateModal form")[0].reset();
        $("#updateModal").modal({
            backdrop:"static"
        });
    });
    //这个是点击删除书籍按钮时弹出模态框的单击事件
    $("#deleteBook").click(function () {
        $("#deleteModal").modal({
            backdrop:"static"
        });
    });
    //这个是点击保存按钮时发送ajax添加书籍的单击事件
    $("#saveBook").click(function () {
       $.ajax({
           url:"addBook",
           type:"POST",
           data:$("#AddModal form").serialize(),
           contentType:"application/x-www-form-urlencoded",
           cache: true,
           async: false,
           success:function (result) {
               if(result.code == 100){
                   $("#AddModal").modal("hide");
                   alert("添加成功")
                   toPage(1);
               }else{
                   alert("添加失败");
                   $("#AddModal").modal("hide");
               }
           }
       })
    });
    //这个是点击查询按钮时发送ajax查询书籍的单击事件
    $("#findBookId").click(function () {
        $.ajax({
            url:"findBooksSpe",
            type:"POST",
            data:$("#findModal form").serialize(),
            contentType:"application/x-www-form-urlencoded",
            cache: true,
            async: false,
            success:function (result){
                var list1 = result.books;
                if(result.code == 100){
                    findBooksSpe(result);
                    alert("总共查询到"+$(list1).length+"条记录")
                    $("#findModal").modal("hide");
                }else{
                    alert("书籍不存在");
                    $("#findModal").modal("hide");
                }
            }
        })
    });
    //这个是点击更新按钮时发送ajax更新书籍的单击事件
    $("#updateBookId").click(function () {
        $.ajax({
            url:"updateBook",
            type:"POST",
            data:$("#updateModal form").serialize(),
            contentType:"application/x-www-form-urlencoded",
            cache: true,
            async: false,
            success:function (result) {
                if (result.code == 100){
                    alert("修改成功");
                    $("#updateModal").modal("hide");
                    toPage(1);
                } else{
                    alert("修改失败,请输入正确的书籍编号");
                    $("#updateModal").modal("hide");
                }

            }
        });
    });
    //这个是点击删除时要发送ajax删除书籍的单击事件
    $("#deleteBookId").click(function () {
        $.ajax({
            url:"deleteBook",
            type:"POST",
            data:$("#deleteModal form").serialize(),
            contentType:"application/x-www-form-urlencoded",
            cache: true,
            async: false,
            success:function (result) {
                if(result.code == 100){
                    if(confirm("确认要删除吗?")){
                        alert("删除成功");
                        $("#updateModal").modal("hide");
                    }
                }else{
                    alert("删除错误,书籍不存在")
                    $("#updateModal").modal("hide");
                }
            }
        });
    });
</script>
</body>
</html>