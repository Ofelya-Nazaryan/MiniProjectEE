package com.example.miniprojectee.manager;

import lombok.SneakyThrows;
import com.example.miniprojectee.models.Article;
import com.example.miniprojectee.models.User;
import com.example.miniprojectee.provider.DBConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class ArticleManager {

    Logger logger = Logger.getLogger(UserManager.class.getName());
    private final Connection connection = DBConnectionProvider.getInstance().getConnection();
    private final CommentManager commentManager = new CommentManager();
    @SneakyThrows
    public Article save(Article article) {
        String sql = "insert into article " +
                "(title, content, user_id)" +
                " values (?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        preparedStatement.setString(1, article.getTitle());
        preparedStatement.setString(2, article.getContent());
        preparedStatement.setInt(3, article.getUser_ID());

        int execute = preparedStatement.executeUpdate();
        ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
        generatedKeys.next();
        int userId = generatedKeys.getInt(1);
        logger.info("New article created: " + article);
        article.setId(userId);
        return article;
    }




    @SneakyThrows
    public List<Article> articlesByAuthor(User author) {
        List<Article> articles = new ArrayList<>();
        PreparedStatement statement = connection.prepareStatement("select * from article where user_id = ?");
        statement.setInt(1, author.getId());
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String title = resultSet.getString("title");
            String content = resultSet.getString("content");
            articles.add(Article.builder()
                    .id(id)
                    .title(title)
                    .content(content)
                    .author(author)
                    .user_ID(author.getId())
                    .build());
        }
        return articles;
    }

    @SneakyThrows
    public List<Article> all() {
        List<Article> articles = new ArrayList<>();
        String sql = "select a.*, u.name, u.surname, u.email from article a " +
                "inner join users u on a.user_id = u.id";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            Article article = Article.builder()
                    .id(resultSet.getInt("id"))
                    .title(resultSet.getString("title"))
                    .content(resultSet.getString("content"))
                    .user_ID(resultSet.getInt("user_id"))
                    .author(User.builder()
                            .name(resultSet.getString("name"))
                            .surname(resultSet.getString("surname"))

                            .build())
                    .build();
            article.setComment(commentManager.commentsByArticle(article));
            articles.add(article);
        }
        return articles;
    }


    @SneakyThrows
    public Article filterbyID(int myId) {
        Article article = null;
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM Article WHERE id = ?");
        statement.setInt(1, myId);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            article=(Article.builder()
                    .id(resultSet.getInt("id"))
                    .title(resultSet.getString("title"))
                    .content(resultSet.getString("content"))
                    .user_ID(resultSet.getInt("user_id"))
                    .build());
        }
        return  article;
    }

}
