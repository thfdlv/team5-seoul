package com.example.jsonExam.community.comment;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper {
    void addComment(CommentDTO comment);
    List<CommentDTO> getCommentsByPostId(@Param("postId") int postId);
    void deleteComment(int id);
    CommentDTO getCommentById(@Param("id") int id); // 삭제 권한 확인용
}
