<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>바둑 교육 사이트 개발</title>
    <style>
        *{
            box-sizing: border-box;  /* 박스 사이즈 */
            margin:0;  /* 마진 */
            padding:0;  /* 패딩 */
        }

        #header {
        position: relative;
        z-index: 100;
        }
        #header .gnb_box {
            max-width: 1050px;
            height: 120px;
            line-height: 120px;
            margin: 0 auto;
            position: relative;
            z-index: 9999;
        }

        #header>.gnb_box>h1 {
            max-width: 400px;
            position: absolute;
            top: 50%;
            left: 0;
            transform: translate(0, -50%);
        }

        #header .gnb_box .cnt_gnb {
            position: absolute;
            width: 380px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        #header .gnb_box .gnb {
            float: right;
        }

        #header .gnb_box .gnb a {
            font-size: 17px;
            font-weight: 700;
        }

        #header .navi {
            border-top: 1px solid #D9D9D9;
            border-bottom: 1px solid #d9d9d9;
            clear: both;
        }

        #header .navi>ul {
            max-width: 1050px;
            width: 100%;
            margin: 0 auto;
            display: table;
            table-layout: fixed;
        }

        #header .navi>ul>li {
            display: table-cell;
            vertical-align: middle;
            position: relative;
        }

        #header .navi>ul>li>a {
            height: 60px;
            line-height: 60px;
            display: block;
            position: relative;
            font-size: 18px;
            font-weight: 700;
            text-align: center;
            letter-spacing: -1px;
        }

        a {
            text-decoration: none;
            color: #333333;
            padding: 0;
            border: 0;
            margin: 0;
        }

        #section {
            position: relative;
            margin: 0 auto;
            max-width: 1050px;
            height: 600px;

        }

        #section>.subnavi {
            width: 205px;
            height: 600px;

            float: left;
            border-right: 1px solid #D9D9D9;
            box-sizing: border-box;
            margin-right: 5px;
        }

        #section>.content {
            width: 630px;
            height: 600px;
            float: left;

            border-right: 1px solid #D9D9D9;
            box-sizing: border-box;
            margin-right: 5px;
        }

        #section>.banner {
            width: 205px;
            height: 600px;

            float: left;    
        }
    </style>
</head>
<body>
    <div id='container'>

        <div id='header'>
            <div class="gnb_box">
				<h1>
                    <img src="./main.png" alt="">
                </h1>

                <div class='cnt_gnb'>
                    <h1>게임으로 배우는 바둑교실</h1>
                </div>

                <div class="gnb">
                    <a href="">로그인 /</a>
                    <a href="">회원 가입</a>
                </div>
	        </div>
            
            <div class='navi'>
                <ul>
                    <li><a href="">서비스 안내</a></li>
                    <li><a href="">학습 서비스</a></li>
                    <li><a href="">구독서비스</a></li>
                    <li><a href="">강사마당</a></li>
                    <li><a href="">관리마당</a></li>
                </ul>
            </div>
        </div>

        <div id='section'>
            <div class='subnavi'>

            </div>
            <div class='content'>

            </div>
            <div class='banner'>

            </div>
        </div>
    </div>
</body>
</html>