package com.example.demo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.entity.GuestVo;


@Mapper
public interface DaoMapper {

	@Select("select * from test")
	List<GuestVo> selectAll() throws Exception;
	
	@Select("select * from test where id=#{id}")
	GuestVo selectOne(int id) throws Exception;
}
