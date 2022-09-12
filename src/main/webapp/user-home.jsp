<%@ page import="com.example.miniprojectee.models.User" %>
<%@ page import="com.example.miniprojectee.models.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.miniprojectee.models.Comment" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 30-Aug-22
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserHome</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>


        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>

<div class="fashinable">
    User home
    <% User currentUser = (User) request.getSession().getAttribute("currentUser");%>
    <%= currentUser.getName() %> <%= currentUser.getSurname() %>
    <br> <br> <br>
<div class="add-article">
    <form id="addArticle" class="input-group" action="add-article" method="post">
        <label for="add_article_title"> Title:<input type="text" class="input-field" name="add_article_title"
                                                     id="add_article_title"></label><br>
        <label for="add_article_content"> Content: <textarea class="input-field" name="add_article_content"
                                                             id="add_article_content"></textarea></label><br>
        <button type="submit" class="submit-btn">Add Article</button>
    </form>
</div>

<div class="all-articles">
    <table>
        <thead>
        <th>Title</th>
        <th>Content</th>
        <th>Author name</th>
        <th>Comments</th>
        <th>Add  Comment</th>
        </thead>
        <%List<Article> allArticles = ((List<Article>) request.getAttribute("allArticles"));%>
        <% for (int i = 0; i < allArticles.size(); i += 1) { %>
        <tr>
            <%Article article =allArticles.get(i); %>
            <td><%=allArticles.get(i).getTitle()%>
            </td>
            <td><%=allArticles.get(i).getContent()%>
            </td>
            <td><%=allArticles.get(i).getAuthor().getName()%>
            </td>
            <td>
                <% for (int j = 0; j < article.getComment().size(); j += 1) { %>
                <%Comment comment =  article.getComment().get(j);%>
                <%=comment.getContent()%>
                    <%=comment.getAuthor().getName()%></br>

                <%}%>
                <%--                <c:forEach var="comment" items="${article.getComments()}">--%>
                <%--                    <font color="#00CC00"><c:out value="${comment.}"/>,</font>--%>
                <%--                </c:forEach>--%>
            </td>
            <td>
                <form action="add-comment" method="post">
                    <input style="visibility: hidden" name="addedArticleId" value="<%= allArticles.get(i).getId()%>">
                    <input name="addedCommentContent" placeholder="Comment">
                    <button type="submit">Add comment</button>
                </form>

            </td>
            <td>
                <form action="delete-article" method="post">
                    <input style="visibility: hidden" name="deletedArticleId" value="<%= allArticles.get(i).getId()%>">
                    <button type="submit">Delete article</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</div>

</div>
</body>
</html>
