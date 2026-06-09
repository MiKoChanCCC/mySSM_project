<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新增商品</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: "Microsoft YaHei", Arial, sans-serif; background: #f5f5f5; padding: 20px; }
        .container { max-width: 600px; margin: 0 auto; background: #fff; border-radius: 8px; box-shadow: 0 2px 12px rgba(0,0,0,0.1); padding: 30px; }
        h2 { text-align: center; color: #333; margin-bottom: 25px; }
        .form-group { margin-bottom: 18px; }
        .form-group label { display: block; margin-bottom: 6px; color: #606266; font-size: 14px; font-weight: 600; }
        .form-group input, .form-group select { width: 100%; padding: 10px 12px; border: 1px solid #dcdfe6; border-radius: 4px; font-size: 14px; }
        .form-group input:focus, .form-group select:focus { outline: none; border-color: #409EFF; }
        .btn-row { text-align: center; margin-top: 25px; }
        .btn { padding: 10px 30px; border-radius: 4px; font-size: 14px; cursor: pointer; border: none; margin: 0 10px; }
        .btn-primary { background: #409EFF; color: #fff; }
        .btn-primary:hover { background: #66b1ff; }
        .btn-default { background: #fff; color: #606266; border: 1px solid #dcdfe6; }
        .btn-default:hover { background: #f5f7fa; }
    </style>
</head>
<body>
<div class="container">
    <h2>新增商品</h2>
    <% if (request.getAttribute("errorMsg") != null) { %>
        <p style="color:#F56C6C;text-align:center;margin-bottom:15px;font-size:14px">${errorMsg}</p>
    <% } %>
    <form action="${pageContext.request.contextPath}/product/add" method="post">
        <div class="form-group">
            <label>商品名称：</label>
            <input type="text" name="goodsName" placeholder="请输入商品名称" required/>
        </div>
        <div class="form-group">
            <label>商品价格（元）：</label>
            <input type="number" name="price" step="0.01" min="0" placeholder="请输入价格" required/>
        </div>
        <div class="form-group">
            <label>库存数量：</label>
            <input type="number" name="stock" min="0" placeholder="请输入库存数量" required/>
        </div>
        <div class="form-group">
            <label>商品分类：</label>
            <input type="text" name="category" placeholder="请输入商品分类" required/>
        </div>
        <div class="form-group">
            <label>上架时间：</label>
            <input type="datetime-local" id="createTime" name="createTime" required/>
            <span id="timeError" style="color:#F56C6C;font-size:12px;display:none">上架时间不能晚于当前时间</span>
        </div>
        <div class="btn-row">
            <button type="submit" class="btn btn-primary">提 交</button>
            <a href="${pageContext.request.contextPath}/product/list" class="btn btn-default">返 回</a>
        </div>
    </form>
</div>
<script>
    var timeInput = document.getElementById('createTime');
    var timeError = document.getElementById('timeError');

    function setMaxTime() {
        var now = new Date();
        var offset = now.getTimezoneOffset() * 60000;
        var local = new Date(now - offset);
        timeInput.max = local.toISOString().slice(0, 16);
    }
    setMaxTime();

    timeInput.addEventListener('change', function () {
        if (this.value && new Date(this.value) > new Date()) {
            timeError.style.display = 'inline';
            this.value = '';
        } else {
            timeError.style.display = 'none';
        }
    });

    document.querySelector('form').addEventListener('submit', function (e) {
        if (timeInput.value && new Date(timeInput.value) > new Date()) {
            e.preventDefault();
            timeError.style.display = 'inline';
            timeInput.value = '';
        }
    });
</script>
</body>
</html>
