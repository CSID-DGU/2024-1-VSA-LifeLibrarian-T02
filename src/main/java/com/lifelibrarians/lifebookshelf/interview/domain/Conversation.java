package com.lifelibrarians.lifebookshelf.interview.domain;

import javax.persistence.*;
import java.time.LocalDateTime;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Entity
@Table(name = "conversations")
@Getter
@ToString(callSuper = true)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Conversation {

	/* 고유 정보 { */
	@Id
	@Column(nullable = false, updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(length = 65535)
	private String content;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private ConversationType conversationType;

	@Column(nullable = false)
	private LocalDateTime createdAt;
	/* } 고유 정보 */

	/* 연관 정보 { */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "interview_id", nullable = false)
	private Interview interview;
	/* } 연관 정보 */

	/* 생성자 { */
	protected Conversation(String content, ConversationType conversationType,
			LocalDateTime createdAt) {
		this.content = content;
		this.conversationType = conversationType;
		this.createdAt = createdAt;
	}

	public static Conversation of(String content, ConversationType conversationType,
			LocalDateTime createdAt) {
		return new Conversation(content, conversationType, createdAt);
	}
	/* } 생성자 */
}
