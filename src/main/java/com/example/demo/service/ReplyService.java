package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDao;
import com.example.demo.vo.Reply;
import com.example.demo.vo.SubRely;

@Service
public class ReplyService {

	private ReplyDao replyDao;

	public ReplyService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	public void writeReply(int loginedMemberId, int columnId, String reply) {
		replyDao.writeReply(loginedMemberId, columnId, reply );
	}

	public int getLastInsertId() {
		return replyDao.getLastInsertId();
	}

	public List<Reply> getReplies(int id) {
		return replyDao.getReplies(id);
	}

	public Reply getReplycount(int id) {
		return replyDao.getReplycount(id);
	}

	public void doSubRely(int loginedMemberId,  int replyId, String reply) {
		replyDao.doSubRely(loginedMemberId, replyId, reply);
	}

	public List<SubRely> getSubReles(int replyId) {
		return replyDao.getSubReles(replyId);
	}

}