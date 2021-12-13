const side1 = `<div class="content-tab-1 sel-ctt">
            <div class="welcome">
                    <div>
                        <p>欢迎管理员：<span>admin</span>! 今天的日期是：<a></a></p>
                    </div>
                </div>
                <div class="stats">
                    <div>数据统计</div>
                    <div>
                        <ul>
                            <li>文章数量（篇）<p>999</p>
                            </li>
                            <li>会员数量（个）<p>99</p>
                            </li>
                            <li>收藏数量（篇）<p>999</p>
                            </li>
                            <li>浏览数量（次）<p>9999</p>
                            </li>
                            <li>FM数量（首）<p>99</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="system">
                    <div>系统信息</div>
                    <div class="details">
                        <table border="1">
                            <tr>
                                <td class="table-left">当前系统版本</td>
                                <td>1.0.180420</td>
                            </tr>
                            <tr>
                                <td class="table-left">服务器地址</td>
                                <td>jiegebuyaoaaa.com</td>
                            </tr>
                            <tr>
                                <td class="table-left">操作系统</td>
                                <td>Window10</td>
                            </tr>
                            <tr>
                                <td class="table-left">运行环境</td>
                                <td>Apache/2.4.23 (Win32) OpenSSL/1.0.2j mod_fcgid/2.3.9</td>
                            </tr>
                            <tr>
                                <td class="table-left">Tomcat版本</td>
                                <td>自己写</td>
                            </tr>
                            <tr>
                                <td class="table-left">MySQL版本</td>
                                <td>自己写</td>
                            </tr>
                            <tr>
                                <td class="table-left">上传附件限制</td>
                                <td>2M</td>
                            </tr>
                            <tr>
                                <td class="table-left">剩余空间</td>
                                <td>86015.2M</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="team">
                    <div>开发团队</div>
                    <div class="details">
                        <table border="1">
                            <tr>
                                <td class="table-left">版权所有</td>
                                <td>愈心于语官网（yysy.com）</td>
                            </tr>
                            <tr>
                                <td class="table-left">开发者团队</td>
                                <td>姚振杰，张坤，孙洋，李硕磊</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>`;
    const side2 = `<div class="content-tab-2 sel-ctt">
            <div class="userManage">
                    <div class="u-search">
                        <form action="">
                            <label for=""><input type="text" placeholder="请输入用户名"><input type="submit"
                                    value="搜索"></label>
                        </form>
                    </div>
                    <div class="u-operate">
                        <a href=""><span class="iconfont">&#xe614;</span>批量删除</a>
                        <a href=""><span class="iconfont">&#xe66c;</span>添加</a>
                        <a href=""><span class="iconfont">&#xe692;</span>刷新</a>
                    </div>
                    <div class="u-table">
                        <table>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox">全选</td>
                                    <td>ID</td>
                                    <td>用户名</td>
                                    <td>邮箱</td>
                                    <td>语录数</td>
                                    <td>浏览数</td>
                                    <td>收藏数</td>
                                    <td>操作</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>
                                        <a href="" title="编辑"><span class="iconfont">&#xe610;</span></a>
                                        <a href="" title="删除"><span class="iconfont">&#xe614;</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="u-page">
                        <ul>
                            <li><a href="">&lt;&lt;</a></li>
                            <li class="highLight"><a href="" >1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">4</a></li>
                            <li><a href="">&gt;&gt;</a></li>
                        </ul>
                        <a href="" class="u-all-page">10</a>
                    </div>
                </div>
            </div>`;
    const side3 = `<div class="content-tab-3 sel-ctt">
                 <div class="userManage">
                    <div class="u-search">
                        <form action="">
                            <label for=""><input type="text" placeholder="请输入语录ID"><input type="submit"
                                    value="搜索"></label>
                        </form>
                    </div>
                    <div class="u-operate">
                        <a href=""><span class="iconfont">&#xe614;</span>批量删除</a>
                        <a href=""><span class="iconfont">&#xe66c;</span>添加</a>
                        <a href=""><span class="iconfont">&#xe692;</span>刷新</a>
                    </div>
                    <div class="u-table">
                        <table>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox">全选</td>
                                    <td>语录ID</td>
                                    <td>用户名</td>
                                    <td>发布时间</td>
                                    <td>是否公开</td>
                                    <td>类型</td>
                                    <td>收藏数</td>
                                    <td>操作</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>
                                        <div id="huakuai-outer">
                                        <div id="huakuai-box">
                                            <a href="javascript:;" class="huakuai-radius huakuai-left"></a>
                                        </div>
                                    </div>
                                    <form action="">
                                        <input class="huakuaiData" type="hidden" name="ispublic" value="0">
                                    </form>
                                    </td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>
                                        <a href="" title="编辑"><span class="iconfont">&#xe610;</span></a>
                                        <a href="" title="删除"><span class="iconfont">&#xe614;</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="u-page">
                        <ul>
                            <li><a href="">&lt;&lt;</a></li>
                            <li class="highLight"><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">4</a></li>
                            <li><a href="">&gt;&gt;</a></li>
                        </ul>
                        <a href="" class="u-all-page">10</a>
                    </div>
                </div>
            </div>`;
    const side4 = `<div class="content-tab-4 sel-ctt">
                <div class="userManage">
                    <div class="u-search">
                        <form action="">
                            <label for=""><input type="text" placeholder="请输入用户名"><input type="submit"
                                    value="搜索"></label>
                        </form>
                    </div>
                    <div class="u-operate">
                        <a href=""><span class="iconfont">&#xe614;</span>批量删除</a>
                        <a href=""><span class="iconfont">&#xe66c;</span>添加</a>
                        <a href=""><span class="iconfont">&#xe692;</span>刷新</a>
                    </div>
                    <div class="u-table">
                        <table>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox">全选</td>
                                    <td>语录ID</td>
                                    <td>用户名</td>
                                    <td>收藏时间</td>
                                    <td>操作</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>
                                        <a href="" title="编辑"><span class="iconfont">&#xe610;</span></a>
                                        <a href="" title="删除"><span class="iconfont">&#xe614;</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>

                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>

                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>

                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>

                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>

                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>

                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="u-page">
                        <ul>
                            <li><a href="">&lt;&lt;</a></li>
                            <li class="highLight"><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">4</a></li>
                            <li><a href="">&gt;&gt;</a></li>
                        </ul>
                        <a href="" class="u-all-page">10</a>
                    </div>
                </div>
            </div>`;

    //构造函数
    function Router() {
      this.routes = {};
      this.currentUrl = "";
    }
    Router.prototype.route = function (path, callback) {
      this.routes[path] = callback || function () {}; //给不同的hash设置不同的回调函数
    };
    Router.prototype.refresh = function () {
      //   console.log(location.hash.slice(1)); //获取到相应的hash值
      this.currentUrl = location.hash.slice(1) || "/home"; //如果存在hash值则获取到，否则设置hash值为/
      // console.log(this.currentUrl);
      if (this.currentUrl && this.currentUrl != "/") {
        this.routes[this.currentUrl](); //根据当前的hash值来调用相对应的回调函数
      }
    };
    Router.prototype.init = function () {
      window.addEventListener("load", this.refresh.bind(this), false);
      window.addEventListener("hashchange", this.refresh.bind(this), false);
    };
    //给window对象挂载属性

    window.Router = new Router();
    window.Router.init();
    let oSidebar = document.querySelector(".content-tab");
    const sidebarList = document.querySelector(".sidebar-list");
    const lis = sidebarList.querySelectorAll("li");
    const bread = document.querySelector(".gotohome");
    Router.route("/home", function () {
      oSidebar.innerHTML = side1;
    });
    Router.route("/user", function () {
      oSidebar.innerHTML = side2;
    });
    Router.route("/yulu", function () {
      oSidebar.innerHTML = side3;
      let huakuaiSpan = document.querySelector(".huakuai-radius");
      let huakuaiDiv = document.querySelector("#huakuai-box");
      let huakuaiData = document.querySelectorAll(".huakuaiData");
      huakuaiSpan.addEventListener("click", (e) => {
        console.log(huakuaiSpan.className);
        if (huakuaiSpan.className === "huakuai-radius huakuai-left") {
          huakuaiSpan.className = "huakuai-radius huakuai-right";
          huakuaiDiv.className = "huakuai-bg";
          huakuaiData.name = "1";
        } else {
          huakuaiSpan.className = "huakuai-radius huakuai-left";
          huakuaiDiv.className = "";
          huakuaiData.name = "0";
        }
      });
    });
    Router.route("/shoucang", function () {
      oSidebar.innerHTML = side4;
    });
    window.addEventListener("load", () => {
      console.log(window.location.hash);
      switch (window.location.hash) {
        case "#/home":
          bread.style.backgroundColor = "#fff";
          break;
        case "#/user":
          lis[0].style.backgroundColor = "rgb(30, 159, 255)";
          break;
        case "#/yulu":
          lis[1].style.backgroundColor = "rgb(30, 159, 255)";
          break;
        case "#/shoucang":
          lis[2].style.backgroundColor = "rgb(30, 159, 255)";
          break;

        default:
          break;
      }
    });
    bread.addEventListener("click", () => {
      bread.style.backgroundColor = "#fff";
      for (let i = 0; i < lis.length; i++) {
        lis[i].style.backgroundColor = "";
      }
    });
    for (let i = 0; i < lis.length; i++) {
      lis[i].addEventListener("click", () => {
        bread.style.backgroundColor = "";
        for (let i = 0; i < lis.length; i++) {
          lis[i].style.backgroundColor = "";
        }
        lis[i].style.backgroundColor = "rgb(30, 159, 255)";
      });
    }