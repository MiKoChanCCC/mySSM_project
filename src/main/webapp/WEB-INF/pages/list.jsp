<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品信息管理</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: "Microsoft YaHei", Arial, sans-serif; background: #f5f5f5; padding: 20px; }
        .container { max-width: 1000px; margin: 0 auto; background: #fff; border-radius: 8px; box-shadow: 0 2px 12px rgba(0,0,0,0.1); padding: 30px; }
        h2 { text-align: center; color: #333; margin-bottom: 20px; font-size: 24px; }
        .toolbar { margin-bottom: 15px; text-align: right; }
        .btn { display: inline-block; padding: 8px 20px; border-radius: 4px; text-decoration: none; font-size: 14px; cursor: pointer; border: none; }
        .btn-primary { background: #409EFF; color: #fff; }
        .btn-primary:hover { background: #66b1ff; }
        .btn-warning { background: #E6A23C; color: #fff; padding: 5px 12px; font-size: 13px; }
        .btn-warning:hover { background: #ebb563; }
        .btn-danger { background: #F56C6C; color: #fff; padding: 5px 12px; font-size: 13px; }
        .btn-danger:hover { background: #f78989; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px 15px; text-align: center; border-bottom: 1px solid #ebeef5; }
        th { background: #f2f6fc; color: #606266; font-weight: 600; }
        tr:hover { background: #f5f7fa; }
        .empty-tip { text-align: center; color: #999; padding: 40px 0; font-size: 16px; }
    </style>
</head>
<body>
<div class="container">
    <h2>商品信息管理</h2>
    <div class="toolbar">
        <a href="${pageContext.request.contextPath}/product/toAdd" class="btn btn-primary">+ 新增商品</a>
    </div>

    <c:if test="${empty productList}">
        <p class="empty-tip">暂无商品数据，请点击上方按钮新增商品。</p>
    </c:if>

    <c:if test="${not empty productList}">
        <table>
            <thead>
            <tr>
                <th>序号</th>
                <th>商品名称</th>
                <th>价格（元）</th>
                <th>库存</th>
                <th>分类</th>
                <th>上架时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productList}" var="p" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>${p.goodsName}</td>
                    <td>${p.price}</td>
                    <td>${p.stock}</td>
                    <td>${p.category}</td>
                    <td><fmt:formatDate value="${p.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/product/toEdit/${p.id}" class="btn btn-warning">编辑</a>
                        <a href="${pageContext.request.contextPath}/product/delete/${p.id}" class="btn btn-danger"
                           onclick="return confirm('确定要删除该商品吗？')">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>
</html>
