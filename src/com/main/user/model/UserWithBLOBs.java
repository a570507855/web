package com.main.user.model;

public class UserWithBLOBs extends User {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.head_portrait
     *
     * @mbg.generated
     */
    private byte[] headPortrait;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.document_by_hand
     *
     * @mbg.generated
     */
    private byte[] documentByHand;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.document_by_front
     *
     * @mbg.generated
     */
    private byte[] documentByFront;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.document_by_back
     *
     * @mbg.generated
     */
    private byte[] documentByBack;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.head_portrait
     *
     * @return the value of user.head_portrait
     *
     * @mbg.generated
     */
    public byte[] getHeadPortrait() {
        return headPortrait;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.head_portrait
     *
     * @param headPortrait the value for user.head_portrait
     *
     * @mbg.generated
     */
    public void setHeadPortrait(byte[] headPortrait) {
        this.headPortrait = headPortrait;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.document_by_hand
     *
     * @return the value of user.document_by_hand
     *
     * @mbg.generated
     */
    public byte[] getDocumentByHand() {
        return documentByHand;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.document_by_hand
     *
     * @param documentByHand the value for user.document_by_hand
     *
     * @mbg.generated
     */
    public void setDocumentByHand(byte[] documentByHand) {
        this.documentByHand = documentByHand;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.document_by_front
     *
     * @return the value of user.document_by_front
     *
     * @mbg.generated
     */
    public byte[] getDocumentByFront() {
        return documentByFront;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.document_by_front
     *
     * @param documentByFront the value for user.document_by_front
     *
     * @mbg.generated
     */
    public void setDocumentByFront(byte[] documentByFront) {
        this.documentByFront = documentByFront;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.document_by_back
     *
     * @return the value of user.document_by_back
     *
     * @mbg.generated
     */
    public byte[] getDocumentByBack() {
        return documentByBack;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.document_by_back
     *
     * @param documentByBack the value for user.document_by_back
     *
     * @mbg.generated
     */
    public void setDocumentByBack(byte[] documentByBack) {
        this.documentByBack = documentByBack;
    }
}