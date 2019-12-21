package com.main.webURL.dao;

import com.main.webURL.model.WebURL;
import com.main.webURL.model.WebURLExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WebURLMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    long countByExample(WebURLExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int deleteByExample(WebURLExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int insert(WebURL record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int insertSelective(WebURL record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    List<WebURL> selectByExampleWithBLOBs(WebURLExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    List<WebURL> selectByExample(WebURLExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    WebURL selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") WebURL record, @Param("example") WebURLExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int updateByExampleWithBLOBs(@Param("record") WebURL record, @Param("example") WebURLExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") WebURL record, @Param("example") WebURLExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(WebURL record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int updateByPrimaryKeyWithBLOBs(WebURL record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table web_url
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(WebURL record);

    /*********************************************/

    List<WebURL> selectList(@Param("page") Integer page, @Param("limit") Integer limit, @Param("webURL") WebURL webURL);

    long count(WebURL webURL);

    int inserts(WebURL webURL);

    int updates(WebURL webURL);

    int deletes(String[] id);
}