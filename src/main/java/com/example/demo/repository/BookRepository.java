package com.example.demo.repository;

import com.example.demo.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findAllByOrderByTitleAsc();
    List<Book> findAllByOrderByTitleDesc();
    List<Book> findByTitleContainingIgnoreCaseOrderByTitleAsc(String title);
    List<Book> findByTitleContainingIgnoreCaseOrderByTitleDesc(String title);
    List<Book> findByTitleContainingIgnoreCaseOrAuthor_NameContainingIgnoreCase(String title, String authorName);


}


