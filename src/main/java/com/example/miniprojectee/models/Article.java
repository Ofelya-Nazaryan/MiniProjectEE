package com.example.miniprojectee.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class Article {

    public static Article commentedArticle;
    private int id;
    private String title;
    private String content;
    private int user_ID;
    private  User author;
    private List<Comment>comment=new ArrayList<>();




}
