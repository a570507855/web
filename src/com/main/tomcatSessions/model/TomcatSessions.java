package com.main.tomcatSessions.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class TomcatSessions {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tomcat_sessions.session_id
     *
     * @mbg.generated
     */
    private String sessionId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tomcat_sessions.session_valid
     *
     * @mbg.generated
     */
    private String sessionValid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tomcat_sessions.max_inactive
     *
     * @mbg.generated
     */
    private Integer maxInactive;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tomcat_sessions.last_access
     *
     * @mbg.generated
     */
    private Long lastAccess;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tomcat_sessions.app_name
     *
     * @mbg.generated
     */
    private String appName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tomcat_sessions.session_data
     *
     * @mbg.generated
     */
    private byte[] sessionData;

    private String maxInactiveString;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date lastAccessDate;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date creationTime;

    private String username;

    private String isMember;

    private String sex;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tomcat_sessions.session_id
     *
     * @return the value of tomcat_sessions.session_id
     *
     * @mbg.generated
     */
    public String getSessionId() {
        return sessionId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tomcat_sessions.session_id
     *
     * @param sessionId the value for tomcat_sessions.session_id
     *
     * @mbg.generated
     */
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId == null ? null : sessionId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tomcat_sessions.session_valid
     *
     * @return the value of tomcat_sessions.session_valid
     *
     * @mbg.generated
     */
    public String getSessionValid() {
        return sessionValid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tomcat_sessions.session_valid
     *
     * @param sessionValid the value for tomcat_sessions.session_valid
     *
     * @mbg.generated
     */
    public void setSessionValid(String sessionValid) {
        this.sessionValid = sessionValid == null ? null : sessionValid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tomcat_sessions.max_inactive
     *
     * @return the value of tomcat_sessions.max_inactive
     *
     * @mbg.generated
     */
    public Integer getMaxInactive() {
        return maxInactive;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tomcat_sessions.max_inactive
     *
     * @param maxInactive the value for tomcat_sessions.max_inactive
     *
     * @mbg.generated
     */
    public void setMaxInactive(Integer maxInactive) {
        this.maxInactive = maxInactive;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tomcat_sessions.last_access
     *
     * @return the value of tomcat_sessions.last_access
     *
     * @mbg.generated
     */
    public Long getLastAccess() {
        return lastAccess;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tomcat_sessions.last_access
     *
     * @param lastAccess the value for tomcat_sessions.last_access
     *
     * @mbg.generated
     */
    public void setLastAccess(Long lastAccess) {
        this.lastAccess = lastAccess;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tomcat_sessions.app_name
     *
     * @return the value of tomcat_sessions.app_name
     *
     * @mbg.generated
     */
    public String getAppName() {
        return appName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tomcat_sessions.app_name
     *
     * @param appName the value for tomcat_sessions.app_name
     *
     * @mbg.generated
     */
    public void setAppName(String appName) {
        this.appName = appName == null ? null : appName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tomcat_sessions.session_data
     *
     * @return the value of tomcat_sessions.session_data
     *
     * @mbg.generated
     */
    public byte[] getSessionData() {
        return sessionData;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tomcat_sessions.session_data
     *
     * @param sessionData the value for tomcat_sessions.session_data
     *
     * @mbg.generated
     */
    public void setSessionData(byte[] sessionData) {
        this.sessionData = sessionData;
    }

    public Date getLastAccessDate() {
        return lastAccessDate;
    }

    public void setLastAccessDate(Date lastAccessDate) {
        this.lastAccessDate = lastAccessDate;
    }

    public String getMaxInactiveString() {
        return maxInactiveString;
    }

    public void setMaxInactiveString(String maxInactiveString) {
        this.maxInactiveString = maxInactiveString;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIsMember() {
        return isMember;
    }

    public void setIsMember(String isMember) {
        this.isMember = isMember;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}