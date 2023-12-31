<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MAIN" />

<%@ include file="head.jsp"%>
<link rel="stylesheet" href="/resource/main.css" />

<!-- <script src="/resource/tostUiChart.js"></script> -->

<!-- 토스트UI 차트 사용하기 위한 cdn -->
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>


		<section class="Admain">
			  <section class="listBody">
		<div class="flex justify-between">
			<h1 class="bg-green-100 inline-block text-3xl p-3">사이트 통계</h1>
		</div>
		<section class="mt-8 text-xl">
			<div class="container mx-auto px-3 border border-green-600 mb-4 w-full ">
				<ul class="flex justify-around p-4">
					<li class="btn"><a href="marketing?type=1">신규 가입자 수</a></li>
					<li class="btn"><a href="marketing?type=2">탈퇴 회원 수와 이유</a></li>
				</ul>
			</div>
			<div>
				<!--h-screen : height: 100vh; 임시 임시 대충 모양 볼려구-->
				<div class="chart-section w-full flex justify-center">
					<div id="chart" class="border border-green-600"></div> 
				</div>
			</div>

		</section>
	</section>
		</section>
		
	<script>
	    const type = ${type}; // 근데 이렇게 해서 꺼내 쓸꺼면 하드 방식과 뭐가 다르지?
	
		const Chart = toastui.Chart;
		const el = document.getElementById('chart');
		
		if(type === 1){
			
			console.log("지나가?")
			
			const data = {
					  categories: ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
					  series: [
					    {
					      name: 'Budget',
					      data: [5000, 3000, 5000, 7000, 6000, 4000, 1000]
					    },
					    {
					      name: 'Income',
					      data: [8000, 4000, 7000, 2000, 6000, 3000, 5000]
					    },
					    {
					      name: 'Expenses',
					      data: [4000, 4000, 6000, 3000, 4000, 5000, 7000]
					    },
					    {
					      name: 'Debt',
					      data: [3000, 4000, 3000, 1000, 2000, 4000, 3000]
					    }
					  ]
					}
			  
			const options = {
			  chart: { width: 700, height: 400 },
			};
			
			//이거는 뭔가조건으로 표시해야지 이전생각은 미친이에요!!
			const chart = Chart.barChart({el, data, options});
		}
			
		
		if(type === 2){
			const data = {
					  categories: ${data.categories},
					  series: [
					    {
					      name: "${data.series[0].get('name')}",
					      data: ${data.series[0].get('data')}
					    },
					    {
					      name: "${data.series[1].get('name')}",
						  data: ${data.series[1].get('data')}
					    },
					    {
						  name: "${data.series[2].get('name')}",
						  data: ${data.series[2].get('data')}
						},
						{
						  name: "${data.series[3].get('name')}",
						  data: ${data.series[3].get('data')}
						}
					  ]
					}
			  
			const options = {
			  chart: { width: 700, height: 400 },
			  series: {
				    stack: true
				  }
			};
			
			//이거는 뭔가조건으로 표시해야지 이전생각은 미친이에요!!
			const chart = Chart.barChart({ el, data, options });
		}
		</script>
					
	</body>
</html>