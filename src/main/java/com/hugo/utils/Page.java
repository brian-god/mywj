package com.hugo.utils;

/**
 *  lxs on 2019/4/4.
 */
public class Page 
{  //每页显示的条目数
    private Integer pageSize;
    //页数
    private Integer pageNum;
    //总条数
    private Integer totalSize;
    //开始条数
    private Integer start;
    //最后条数
    private Integer end;
    //总页数
    public Integer totalPage;

    /***
     *
     *  @Description: 计算总页数
     *  @param totalSize 总条数
     *  @param pageSize 每页条目数
     *  @return
     */
    public Integer getSumPage(Integer totalSize, Integer pageSize) {
        checkZero(pageSize);
        if (totalSize % pageSize == 0) {
            totalPage = totalSize / pageSize;
        } else {
            totalPage = totalSize / pageSize + 1;
        }
        return totalPage;
    }

    /***
     *
     *  @Description: 計算起始條數
     *  @param pageNum 当前页数
     *  @param pageSize 每页条目数
     *  @return startSize
     */
    public Integer getStartSize (Integer pageNum, Integer pageSize) {
        checkZero(pageSize);
        if (pageNum >= 1) {
            start = (pageNum-1) * pageSize;
        } else {
            start = 0;
        }
        return start;
    }

    /***
     *
     *  @Description: 計算末尾條數
     *  @param pageNum
     *  @param pageSize
     *  @return endSize
     */
    public Integer getEndSize (Integer pageNum, Integer pageSize) {
        checkZero(pageSize);
        if (pageNum >= 1) {
            end = pageNum * pageSize;
        } else {
            end = 0;
        }
        return end;
    }


    public Integer checkZero(Integer pageSize) {
        if (pageSize == 0) {
            pageSize = 10;
        }
        return pageSize;
    }


    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getTotalSize() {
        return totalSize;
    }

    public void setTotal(Integer totalSize) {
        this.totalSize = totalSize;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public void setTotalSize(Integer totalSize) {
        this.totalSize = totalSize;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }
}  

