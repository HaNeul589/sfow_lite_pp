<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고별 재고현황</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>
	<script>
		var gridData=[];
	    var grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: gridData,
	      scrollX: false,
	      scrollY: false,
	      rowHeaders: [{
              type: 'rowNum',
              header: "  ",
              width: 50,
          },{type : 'checkbox'}     ],
	      columns: [
	        {
	          header: '회사코드',
	          name: 'company_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: 'ITEM코드',
	          name: 'item_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '창고코드',
	          name: 'warehouse_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '구역코드',
	          name: 'area_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: 'LOT번호',
	          name: 'lot_no',
	          sortable: true,
	          align:'center'
	        },
// 	        {
// 	          header: '품목구분',
// 	          name: 'item_type',
// 	          sortable: true,
// 	          align:'center'
// 	        },
			{
              header: '품목구분',
                sortable: true,
                editor:'text', 
                align:'center', 
                name: 'item_type',
                editor: {
                          type: 'select',
                          options: {
                          listItems: [
                               {text: "제품", value: "제품"},
                               {text: "반제품", value: "반제품"},
                               {text: "원자재", value: "원자재"},
                               {text: "상품", value: "상품"},
                               {text: "기타", value: "기타"},
                               //{text: "설비", value: "설비"},
                               //{text: "설비예비부품", value: "설비예비부품"},
                               //{text: "금형", value: "금형"},
                               //{text: "금형예비부품", value: "금형예비부품"},
                               //{text: "치공구", value: "치공구"},
                               //{text: "검사장비", value: "검사장비"},
                                    ]
                                  }
                  }
            },
	        {
		       header: '품명',
		       name: 'item_name',
		       sortable: true,
		       align:'center'
		      },
	        {
	          header: '창고이름',
	          name: 'warehouse_name',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '규격', 
	          name: 'item_specification',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '양품수량',
	          name: 'pass_quantity',
	          sortable: true,
	          editor:'text',
	          align:'center'
	          
	        },
	        {
	          header: '불량수량',
	          name: 'fail_quantity',
	          sortable: true,
	          editor:'text',
	          align:'center'
	        },
	        {
	          header: '총수량',
	          name: 'quantity',
	          sortable: true,
	          editor:'text',
	          align:'center'
	        },
	        {
	          header: '재고상태',
	          name: 'stock_status',
	          sortable: true,
	          align:'center'
	        }
	      ]
	    });
	    
	    /*
	    grid.on('check', (ev) => {
	    	var warehousename = document.getElementById('warehousename');
	    	var test = gridData[0].warehouse_name;
	    	warehousename.innerText=test;
	    	const rowKey = ev.rowKey;
	    	const rowData = grid.getRow(rowKey);
			alert(gridData[0]);
			alert(rowData);
	    	alert(gridData[0].warehouse_name);
	    	
	    	});*/ 

	    	//checkbox 체크 시에 input 태그에 해당 value 출력(checkbox 다중 선택시 데이터 초기화 기능 추가)
    	   	grid.on('check', function(ev) {
	            const rowKey = ev.rowKey;
	            const columnName = ev.columnName;
	            var updatedData = {};
	            const rowData = grid.getRow(rowKey);
	            console.log('Row data: ', rowData);
	            if(grid.getCheckedRows().length==1){
		    	var warehouse_name = document.getElementById('warehouse_name');
		    	var lot_no = document.getElementById('lot_no');
		    	var item_type = document.getElementById('item_type');
		    	var item_code = document.getElementById('item_code');
		    	var item_name = document.getElementById('item_name');
		    	var test1 =rowData.warehouse_name;
		    	var test2 =rowData.lot_no;
		    	var test3 =rowData.item_type;
		    	var test4 =rowData.item_code;
		    	var test5 =rowData.item_name;
		    	//alert(rowData.warehouse_name);
		    	//warehousename.innerText=test;
		    	warehouse_name.value=test1;
		    	warehouse_name.readOnly=true;
		    	//style="outline: none;" -->html 적용 문법
		    	//input:focus {outline: none;} --> style 적용 문법
		    	warehouse_name.style.outline='none';
		    	lot_no.value=test2;
		    	lot_no.readOnly=true;
		    	lot_no.style.outline='none';
		    	item_type.value=test3;
		    	//item_type.selected=true;
		    	item_type.disabled=true;
		    	//item_type.onfocus='initialSelect = selectedIndex;'
		    	//item_type.onchange='selectedIndex = initialSelect;'
		    	//onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'
		    	item_code.value=test4;
		    	item_code.readOnly=true;
		    	item_code.style.outline='none';
		    	item_name.value=test5;
		    	item_name.readOnly=true;
		    	item_name.style.outline='none';
	            }else{
		    		//grid.uncheckAll() ;
		    		var warehouse_name = document.getElementById('warehouse_name');
			    	var lot_no = document.getElementById('lot_no');
			    	var item_type = document.getElementById('item_type');
			    	var item_code = document.getElementById('item_code');
			    	var item_name = document.getElementById('item_name');
			       	//warehousename.innerText="";
		    		warehouse_name.value="";
		    		warehouse_name.readOnly=false;
		    		warehouse_name.style.removeProperty('outline');
		    		lot_no.value="";
		    		lot_no.readOnly=false;
		    		lot_no.style.removeProperty('outline');
		    		item_type.value="";
		    		//item_type.readOnly=enabled;
		    		item_type.disabled=false;
		    		item_code.value="";
		    		item_code.readOnly=false;
		    		item_code.style.removeProperty('outline');
		    		item_name.value="";
		    		item_name.readOnly=false;
		    		item_name.style.removeProperty('outline');

	            }
		    	
		    	
	    	   	});
	    	
	    	//checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
	    	grid.on('uncheck', (ev) => {
	    		var warehouse_name = document.getElementById('warehouse_name');
		    	var lot_no = document.getElementById('lot_no');
		    	var item_type = document.getElementById('item_type');
		    	var item_code = document.getElementById('item_code');
		    	var item_name = document.getElementById('item_name');
		       	//warehousename.innerText="";
	    		warehouse_name.value="";
	    		warehouse_name.readOnly=false;
	    		warehouse_name.style.removeProperty('outline');
	    		lot_no.value="";
	    		lot_no.readOnly=false;
	    		lot_no.style.removeProperty('outline');
	    		item_type.value="";
	    		//item_type.readOnly=enabled;
	    		item_type.disabled=false;
	    		//item_type.style.removeProperty('outline');
	    		item_code.value="";
	    		item_code.readOnly=false;
	    		item_code.style.removeProperty('outline');
	    		item_name.value="";
	    		item_name.readOnly=false;
	    		item_name.style.removeProperty('outline');
	    		
	    	});
	    	
	    	//reset button 리셋 함수 그리드 내에 단일 check 된 데이터 초기화
	    	function uncheck(){
		    		grid.uncheckAll() ;
		    		var warehouse_name = document.getElementById('warehouse_name');
			    	var lot_no = document.getElementById('lot_no');
			    	var item_type = document.getElementById('item_type');
			    	var item_code = document.getElementById('item_code');
			    	var item_name = document.getElementById('item_name');
			       	//warehousename.innerText="";
		    		warehouse_name.value="";
		    		warehouse_name.readOnly=false;
		    		warehouse_name.style.removeProperty('outline');
		    		lot_no.value="";
		    		lot_no.readOnly=false;
		    		lot_no.style.removeProperty('outline');
		    		item_type.value="";
		    		//item_type.readOnly=enabled;
		    		item_type.disabled=false;
		    		item_code.value="";
		    		item_code.readOnly=false;
		    		item_code.style.removeProperty('outline');
		    		item_name.value="";
		    		item_name.readOnly=false;
		    		item_name.style.removeProperty('outline');
	    		
	    		
	    	};
	    	
	    	

	    	  	
	   //전체 데이터 select 데이터(항상보이기)
	//function checkstock(){
		   // make AJAX call to server
	    $.ajax({
	      type:"POST", //요청방식 
	      dataType:"JSON",
	      url: '<%=request.getContextPath()%>/searchAllStock',
	  	      success: function(data) {
	      	 	gridData=data
	    	  	grid.resetData(data)
	    	   	
	    	   	grid.on('editingFinish', function(ev) {
	            const rowKey = ev.rowKey;
	            const columnName = ev.columnName;
	            var updatedData = {};
	            const rowData = grid.getRow(rowKey);
	            console.log('Row data: ', rowData);
	            //alert(rowData);
	            
	            $.ajax({
	                 url: '<%=request.getContextPath()%>/updateStock',
	                 method: 'PATCH',
	                 dataType: 'JSON',
	                 data: JSON.stringify(rowData),
	                 contentType: 'application/json',
	                 success: function(response) {
	                     console.log('Success:', response);
	                 },
	                 error: function(error) {
	                     console.log('Error:', error);
	                 }
	             }); 
	    	   	});
	    	  },
	      error: function(xhr, status, error) {
	        // handle error
	        console.log(error);
	      }
	    });

		   
		   
	//조회버튼 누를 시 가져오는 데이터 리스트  
	function checkStock(){
		//grid.clear();
// $(document).ready(function() {
//   $('#searchBtn').click(function(event) {
// 	  event.preventDefault();

	    // get search parameters
	var warehouse_code = $('#warehouse_code').val();
    var warehouse_name = $('#warehouse_name').val();
    var lot_no = $('#lot_no').val();
    var item_type = $('#item_type').val();
    var item_code = $('#item_code').val();
    var item_name = $('#item_name').val();
	    $.ajax({
		      type:"POST", //요청방식 
		      dataType:"JSON",
		      url: '<%=request.getContextPath()%>/searchWhStock',
		      //contentType: 'application/json',
		      //data: JSON.stringify({
		    	  data: {
		    	  warehouse_code: warehouse_code,
		          warehouse_name: warehouse_name,
		          lot_no: lot_no,
		    	  item_type: item_type,
		          item_code: item_code,
		          item_name: item_name
		    	  },
		        //}),
		  	      success: function(data) {
		  	    	
		      	 	gridData=data
		    	  	grid.resetData(data)
		    	   	
		    	   	grid.on('editingFinish', function(ev) {
		            const rowKey = ev.rowKey;
		            const columnName = ev.columnName;
		            var updatedData = {};
		            const rowData = grid.getRow(rowKey);
		            console.log('Row data: ', rowData);
		            //alert(rowData);
		            
		            $.ajax({
		                 url: '<%=request.getContextPath()%>/updateStock',
		                 method: 'PATCH',
		                 dataType: 'JSON',
		                 data: JSON.stringify(rowData),
		                 //data: {rowData},
		                 contentType: 'application/json',
		                 success: function(response) {
		                     console.log('Success:', response);
		                 },
		                 error: function(error) {
		                     console.log('Error:', error);
		                 }
		             }); 
		    	   	});
		    	  },
		      error: function(xhr, status, error) {
		        // handle error
		        console.log(error);
		      }
		    });
//    		});
// }); 
	};
	    
	//초기화 버튼 더블 클릭시에 그리드 데이터 클리어
	$(document).ready(function() {
	 $('#resetBtn').dblclick(function(event) {
		  event.preventDefault();
		  grid.clear();
	 	});
	 });
	
</script>


<script>
//modal에 띄워지는 grid2

  var body = document.querySelector('body');
  var modal = document.querySelector('.modal');
  var btnOpenPopup = document.querySelector('.btnFas');

	var grid2=null;	 //추가된 부분!!
	function resetCheck() {
	  if (grid2) {
	    grid2.uncheckAll();
	  }
	}
	
	//modal 닫기 함수
	function closeModal() {
		  modal.classList.remove('show');
	         body.style.overflow = 'auto';
		}	
	
	
	
	//modal 안에 grid2의 checkbox 체크된 row데이터 input태그에 찍기
	function applyModal() {
		// grid2가 존재하고 데이터가 있을 때만 이벤트 리스너 등록
		// if (grid2 && grid2.getData().length > 0) {   
		        //modal.classList.toggle('show');
		        //body.style.overflow = 'auto';
	      if (grid2 && grid2.getCheckedRows().length == 1) {
	   	    const checkedRows = grid2.getCheckedRows();
	   	    const warehouse_code = document.getElementById('warehouse_code');
	   	    warehouse_code.value = checkedRows[0].warehouse_code;
	        //alert(warehouse_code.value);
//	         var warehouse_code = document.getElementById('warehouse_code');
//	         var test = rowData.warehouse_code;
//	         warehouse_code.value = test;
	      }else if(grid2 && grid2.getCheckedRows().length > 1){
	    	  const warehouseCodes = [];
	    	  //document.querySelectorAll('input[name=warehouse_code]:checked').forEach((el) => {
	    	    //warehouseCodes.push(el.value);
	    	   grid2.getCheckedRows().forEach(rowData => {
        		warehouseCodes.push(rowData.warehouse_code);
	    	  });
	    	  //const warehouseCodesString = warehouseCodes.join('@N@');// @로 구분된 문자열
	    	  const warehouseCodesString = warehouseCodes.map(code => code.trim()).join('@N@');
	    	  //.map() 메소드는 자바스크립트 배열에서 사용 가능한 메소드 중 하나. 이 메소드는 배열의 모든 요소에 대해 주어진 함수를 호출하고, 그 결과를 새로운 배열로 반환.
	    	  //위 코드에서는 warehouseCodes 배열의 모든 요소에 대해 trim() 함수를 호출하여 문자열 앞뒤 공백을 제거한 후, @N@ 구분자로 연결한 문자열을 생성.
			  //여기서 code는 콜백 함수의 매개변수로서, 현재 배열 요소를 가리키고, 코드 내에서는 이 요소의 문자열 앞뒤 공백을 제거한 후 반환.
	    	  const warehouse_code = document.getElementById('warehouse_code');
	    	  warehouse_code.value = warehouseCodesString; // input 요소에 문자열 할당
	    	  console.log(warehouseCodesString);
	      }   
	      
	         modal.classList.remove('show');
	         body.style.overflow = 'auto';
		   // });
		}	
	

//modal안에 grid2에 찍히는 창고코드, 창고이름 리스트
$(document).ready(function() {
	
	//reset button 리셋 함수 그리드 내에 단일 check 된 데이터 초기화
// 	function resetCheck(){
// 		grid2.uncheckAll();
// 	};

	
  //$('.btn-open-popup').dblclick(function(event) {
  $('.btnFas').dblclick(function(event) {
	  
  
	  event.preventDefault();
	//추가된 부분!!
	  if(grid2){
		  grid2.destroy();
	  }
	  
	var gridData2=[];
  	grid2 = new tui.Grid({
  	el: document.getElementById('modalGrid'),
  	data: gridData2,
  	scrollX: false,
  	scrollY: false,
  	autoWidth: true,
  	rowHeaders: [{
   	   type: 'rowNum',
   	   header: "  ",
   	   width: 50
  	},{type : 'checkbox'}],
  	columns: [
   	 {
    	header: '창고코드',
      	name: 'warehouse_code',
      	sortable: true,
      	align:'center',
      	width:165
    	},
    	{
      	header: '창고명',
      	name: 'warehouse_name',
      	sortable: true,
      	align:'center',
      	width:165
    	}
  	]
	});
  	

$.ajax({
    type:"POST", //요청방식 
    dataType:"JSON",
    url: '<%=request.getContextPath()%>/searchWhList',
	      success: function(data) {
	    	gridData2=data
  	  		grid2.resetData(data)
  	   	
  	  },
    error: function(xhr, status, error) {
      // handle error
      console.log(error);
    }
  });
  
	  //modal 안에 grid 행 checkbox 체크시 row데이터 출력(웹 console에만 출력하는 용도)
		grid2.on('check', function(ev) {
	    const rowKey = ev.rowKey;
	    const columnName = ev.columnName;
	    var updatedData = {};
	    const rowData = grid2.getRow(rowKey);
	    console.log('Row data: ', rowData);
	    console.dir('Row data: ', rowData);
		}); 

	});//double클릭 이벤트 끝
	
});//document.ready끝	


  //modal 띄우기
  btnOpenPopup.addEventListener('dblclick', () => {
    modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
    	body.style.overflow = 'hidden';
    }
  });

  //modal 클릭 이벤트 리스너(modal 밖의 바탕을 누르면 modal 창 닫히는 이벤트 리스너 = 닫기 버튼 생성으로 주석처리)
  
/*   modal.addEventListener('click', (event) => {
    if (event.target === modal) {
      modal.classList.toggle('show');

      if (!modal.classList.contains('show')) {
        body.style.overflow = 'auto';
      }
    }
  }); */

	function whSearch(){
		var warehouse_code = $('#warehouse_code').val();
	    var warehouse_name = $('#warehouse_name').val();
		    $.ajax({
			      type:"POST", //요청방식 
			      dataType:"JSON",
			      url: '<%=request.getContextPath()%>/searchWh',
			      //contentType: 'application/json',
			      //data: JSON.stringify({
			    	  data: {
			    	  warehouse_code: warehouse_code,
			          warehouse_name: warehouse_name
			    	  },
			        //}),
			  	      success: function(data) {
			  	    	
			      	 	gridData2=data
			    	  	grid2.resetData(data)
			    	   	
			    	  },
			      error: function(xhr, status, error) {
			        // handle error
			        console.log(error);
			      }
			    });

  		}

  

  
</script>





<style>
	
		.form-title{
		width : 100px;
		height: 30px;
		color:black;
		font-weight:bold;
 		background-color: #e2e2e2;
/* 		background-color: #828282; */
		border:1px solid #e2e2e2;
		text-align:center;
	/* 	vertical-align: middle; */
		line-height : 30px;
		border-radius:3px;
		display:inline-block;
		}
		
		.form-data{
		width : 200px;
		height: 30px;
/* 		background-color: rgb(230, 242, 255) */
/* 		text-align:center; */
	/* 	vertical-align: middle; */
		line-height : 30px;
		border-radius:3px;
		border:1px solid #e2e2e2;
		display:inline-block;
		}
		
		.btn-open-popup{
		width : 200px;
		height: 30px;
		background-color: rgb(230, 242, 255);
		text-align:left;
	/* 	vertical-align: middle; */
		line-height : 30px;
		border-radius:3px;
		border:1px solid #e2e2e2;
		display:inline-block;
		}
	
	.modal {
	  position: absolute;
	  top: 0;
	  left: 0;
	
	  width: 100%;
	  height: 100%;
	
	  display: none;
	  background-color: rgba(0, 0, 0, 0.4);
	}
	 
	.modal.show {
	  display: block;
	}
	
	#modalGrid {
	position: relative; /* 변경된 부분 */
/* 	  position: absolute; */
	  top: 50%;
	  left: 50%;
	
	  width: 500px;
	  height: 500px;
	
	  padding: 40px;
	
	  text-align: center;
	
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	  transform: translateX(-50%) translateY(-50%);
	}
	
	.modal-wrapper {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	
	
	

  .search_wh .form-title{
    border-radius:3px;
	line-height : 30px;
  }

  .search_wh input[type="text"] {
    border: none;
    outline: none;
    border-radius:3px;
    border:1px solid #e2e2e2;
    line-height : 30px;
	height: 30px;
  }

  .search_wh .fas.fa-search {
/*     margin-right: 4px; */
  }

  .search_wh input[type="text"]#lens_sh {
    margin-left:-0.5px;

  }

  .search_wh input[type="text"].btn-open-popup {
    padding-left: 30px;
    cursor: text;
    margin-left:-3.5px;
	margin-right:5px;
  }
  
  .search_wh input[type="text"].btn-open-popup:focus {
    outline: none;
  }
  
  .search_wh i.fa-search {
    position: absolute;
    left: 5px;
    top: 50%;
    transform: translateY(-50%);
    z-index: 1;
  }
	

#applyBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 300px; /* 버튼 위치 조정 */
}

#resetMdBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 210px; /* 버튼 위치 조정 */
}


#closeBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 120px; /* 버튼 위치 조정 */
}

#whSearchBtn {

}


    #modalSearch {
        display: flex;
        align-items: center;
    }

    #whSearch {
        flex: 1;
        margin: 0;
        padding: 0;
        border-radius: 4px;
    }
    /*
    flex: 1은 Flexbox 레이아웃에서 아이템이 차지하는 공간을 설정하는 속성. 
    Flexbox 레이아웃은 부모 요소에 display: flex 를 지정하여 해당 요소의 자식 요소들을 유연하게 배치할 수 있는 방법.
	flex: 1은 아이템이 자신이 속한 Flexbox 컨테이너의 가로 축을 따라 가득 차도록 설정하는 속성. 
	즉, 아이템의 너비를 자동으로 설정하여 아이템 간 공간을 균등하게 분배하는데 
	이는 부모 요소의 너비가 변할 때 자식 요소들이 자동으로 크기를 조절할 수 있도록 함.
	위 예시 코드에서는 #whSearch 요소에 flex: 1을 적용하여, #whSearch 요소가 남은 공간을 모두 차지하도록 설정. 
	따라서 #whSearch과 #whSearchBtn 요소가 부모 요소 #modalSearch 내에서 똑바로 가로 정렬.
	*/

    #whSearchBtn {
        margin: 0;
        padding: 0;
        height: 28px;
	    width: 60px;
	    font-size: 13px;
	    color: black;
	    border: 1px solid #8c8c8c;
	    border-radius: 4px;
	    bottom: 10px;
    }

	input::placeholder {
	  color: grey;
	  font-style: italic;
	  font-size:5px;
	}
</style>


<body>

<%-- 	<form id=stockSearch name=stockSearch action="<%=request.getContextPath()%>/stockSearch" method="post"> --%>
	<form id=stockSearch name=stockSearch>
<!-- 		<div class=form-title></div><div><input type="text" id="tSearch" name="tSearch" /></div> -->
<!-- 		<input type="submit" value="조회" id="searchStockList"/> -->
		&nbsp;<button type="button" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" onclick="checkStock()"><img src="<%=request.getContextPath()%>/resources\img\stock\lens.png" width="11px"/>&nbsp;&nbsp;조회</button>&nbsp;
<%-- 		&nbsp;<button type="submit" id="searchBtn" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><img src="<%=request.getContextPath()%>/resources\img\stock\lens.png" width="11px"/>&nbsp;&nbsp;조회</button>&nbsp; --%>
<%-- 					<button type="reset" onclick="item_type.disabled=false;" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><img src="<%=request.getContextPath()%>/resources\img\stock\reset.png" width="11px"/>&nbsp;&nbsp;초기화</button> --%>
					<button type="reset" id="resetBtn" onclick="uncheck()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><img src="<%=request.getContextPath()%>/resources\img\stock\reset.png" width="11px"/>&nbsp;&nbsp;초기화</button>

<br/><br/>
<!-- <input type="button" value="창고 검색" style="border:1px solid #e2e2e2;" /> -->
<!-- <div class="form-title" style="display: inline-block;">창고 검색</div> -->
<!-- <div style="display:inline-block; margin:5px; font-size:13px; color:black;"> -->
<!-- <input type="text" class="form-title" value="창고검색" disabled/><input type="text" class="btn-open-popup" id ="warehouse_code" name="warehouse_code" style="background-color: rgb(230, 242, 255);"/></div> -->

<div class="search_wh" style="display:inline-block; margin-left:6px; font-size:13px; color:black;">
  <input type="text" class="form-title" id="lens_sh" value="창고검색" disabled/>
  <span style="position: relative;" class="btnFas">
    <input type="text" class="btn-open-popup" id="warehouse_code" name="warehouse_code" style="background-color: rgb(230, 242, 255);"/>
    <i class='fas fa-search' style="position: absolute; transform: translateY(-50%);"></i>
  </span>
</div>

<!-- 백업 -->
<!-- <div class="search_wh" style="display:inline-block; margin-left:6px; font-size:13px; color:black;"> -->
<!--   <input type="text" class="form-title" value="창고검색" disabled/> -->
<!--   <span style="position: relative;"> -->
<!--     <input type="text" class="btn-open-popup" id="warehouse_code" name="warehouse_code" style="background-color: rgb(230, 242, 255);"/> -->
<!--     <i class='fas fa-search' style="position: absolute; left: 5px; top: 50%; transform: translateY(-50%);"></i> -->
<!--   </span> -->
<!-- </div> -->



<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >창고검색</div><div class="form-data" style="background-color: rgb(230, 242, 255);"><input type="text"  style="border:none; height:25px; width:190px; background-color: rgb(230, 242, 255);"></div></div> -->

<%-- <button type="button" class="form-title" style="background-color: rgb(230, 242, 255);"><img src="<%=request.getContextPath()%>/resources\img\stock\lens.png" width="11px" /><input type="text" class="form-data" id ="" name="" style="background-color: rgb(230, 242, 255);"/></button> --%>



<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="창고이름" disabled/><input type="text" class="form-data" id ="warehouse_name" name="warehouse_name"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >창고명</div><div class="form-data" id ="warehousename"><input type="text"  style="border:none; height:25px; width:190px;" ></div></div> -->
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >창고명</div><div class="form-data" id ="warehousename" contenteditable="true" style="background-color:white; word-wrap:normal; white-space: pre-wrap; width:200px;"></div></div> -->

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="LOT번호" disabled/><input type="text" class="form-data" id ="lot_no" name="lot_no"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >LOT번호</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품목구분" disabled/><select class="form-data" id="item_type" name="item_type">
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >품목구분</div><div class="form-data"><select name="choice" id="choice" style="border:none; height:25px; width:200px;">  -->
    <option value="" 				<c:if test="${choice == ''}">selected</c:if>>--</option>
    <option value="제품" 			<c:if test="${choice == '제품'}">selected</c:if>>제품</option>
    <option value="반제품" 		<c:if test="${choice == '반제품'}">selected</c:if>>반제품</option>
    <option value="원자재" 	<c:if test="${choice == '원자재'}">selected</c:if>>원자재</option>
    <option value="상품" 		<c:if test="${choice == '상품'}">selected</c:if>>상품</option>
    <option value="기타" 			<c:if test="${choice == '기타'}">selected</c:if>>기타</option>
</select></div>

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="ITEM코드" disabled/><input type="text" class="form-data" id ="item_code" name="item_code"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >ITEM코드</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품명" disabled/><input type="text" class="form-data" id ="item_name" name="item_name"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >품명</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->

<!-- <div style="display:inline-block; margin:5px;"><input type="text" class="form-title" value="품번" disabled/><input type="text" class="form-data" id ="" name=""/></div> -->
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >품번</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->
</form>
	<br/>
	<hr/>
<h6 style="color:black; font-weight:bold; font-size:15px;">&nbsp;창고별 재고현황</h6>
	
<div id="grid"></div>


<div class="modal">
  <!-- modal에 grid 띄우기 -->
  <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">
  	<!-- modal창 내 창고코드 & 창고이름 검색 창 및 버튼-->
    <form id="modalSearch" name="modalSearch">
    <input type="text" id="whSearch" name="whSearch" placeholder="창고코드  & 창코이름 입력 후 검색 실행"/>
    <button type="button" id="whSearchBtn" name="whSearchBtn" onclick="whSearch()">검색</button>
    </form>
    <br/>
    
    <!-- modal 창 내에 기능 버튼 추가 -->
    <button type="button" id="applyBtn" onclick="applyModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources\img\stock\apply.png" width="13px"/>&nbsp;&nbsp;적용
    </button>
    
    <button type="reset" id="resetMdBtn" onclick="resetCheck()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources\img\stock\reset.png" width="11px"/>&nbsp;&nbsp;초기화
    </button>
    
    <button type="button" id="closeBtn" onclick="closeModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources\img\stock\ex.png" width="11px"/>&nbsp;&nbsp;닫기
    </button>
  </div>
</div>
  
    
</body>



</html>






=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고별 재고현황</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>
	<script>
		var gridData=[];
	    var grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: gridData,
	      scrollX: false,
	      scrollY: false,
	      rowHeaders: [{
              type: 'rowNum',
              header: "  ",
              width: 50,
          },{type : 'checkbox'}     ],
	      columns: [
	        {
	          header: '회사코드',
	          name: 'company_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: 'ITEM코드',
	          name: 'item_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '창고코드',
	          name: 'warehouse_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '구역코드',
	          name: 'area_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: 'LOT번호',
	          name: 'lot_no',
	          sortable: true,
	          align:'center'
	        },
// 	        {
// 	          header: '품목구분',
// 	          name: 'item_type',
// 	          sortable: true,
// 	          align:'center'
// 	        },
			{
              header: '품목구분',
                sortable: true,
                editor:'text', 
                align:'center', 
                name: 'item_type',
                editor: {
                          type: 'select',
                          options: {
                          listItems: [
                               {text: "제품", value: "제품"},
                               {text: "반제품", value: "반제품"},
                               {text: "원자재", value: "원자재"},
                               {text: "상품", value: "상품"},
                               {text: "기타", value: "기타"},
                               //{text: "설비", value: "설비"},
                               //{text: "설비예비부품", value: "설비예비부품"},
                               //{text: "금형", value: "금형"},
                               //{text: "금형예비부품", value: "금형예비부품"},
                               //{text: "치공구", value: "치공구"},
                               //{text: "검사장비", value: "검사장비"},
                                    ]
                                  }
                  }
            },
	        {
		       header: '품명',
		       name: 'item_name',
		       sortable: true,
		       align:'center'
		      },
	        {
	          header: '창고이름',
	          name: 'warehouse_name',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '규격', 
	          name: 'item_specification',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '양품수량',
	          name: 'pass_quantity',
	          sortable: true,
	          editor:'text',
	          align:'center'
	          
	        },
	        {
	          header: '불량수량',
	          name: 'fail_quantity',
	          sortable: true,
	          editor:'text',
	          align:'center'
	        },
	        {
	          header: '총수량',
	          name: 'quantity',
	          sortable: true,
	          editor:'text',
	          align:'center'
	        },
	        {
	          header: '재고상태',
	          name: 'stock_status',
	          sortable: true,
	          align:'center'
	        }
	      ]
	    });
	    
	    /*
	    grid.on('check', (ev) => {
	    	var warehousename = document.getElementById('warehousename');
	    	var test = gridData[0].warehouse_name;
	    	warehousename.innerText=test;
	    	const rowKey = ev.rowKey;
	    	const rowData = grid.getRow(rowKey);
			alert(gridData[0]);
			alert(rowData);
	    	alert(gridData[0].warehouse_name);
	    	
	    	});*/ 

	    	//checkbox 체크 시에 input 태그에 해당 value 출력(checkbox 다중 선택시 데이터 초기화 기능 추가)
    	   	grid.on('check', function(ev) {
	            const rowKey = ev.rowKey;
	            const columnName = ev.columnName;
	            var updatedData = {};
	            const rowData = grid.getRow(rowKey);
	            console.log('Row data: ', rowData);
	            if(grid.getCheckedRows().length==1){
		    	var warehouse_name = document.getElementById('warehouse_name');
		    	var lot_no = document.getElementById('lot_no');
		    	var item_type = document.getElementById('item_type');
		    	var item_code = document.getElementById('item_code');
		    	var item_name = document.getElementById('item_name');
		    	var test1 =rowData.warehouse_name;
		    	var test2 =rowData.lot_no;
		    	var test3 =rowData.item_type;
		    	var test4 =rowData.item_code;
		    	var test5 =rowData.item_name;
		    	//alert(rowData.warehouse_name);
		    	//warehousename.innerText=test;
		    	warehouse_name.value=test1;
		    	warehouse_name.readOnly=true;
		    	//style="outline: none;" -->html 적용 문법
		    	//input:focus {outline: none;} --> style 적용 문법
		    	warehouse_name.style.outline='none';
		    	lot_no.value=test2;
		    	lot_no.readOnly=true;
		    	lot_no.style.outline='none';
		    	item_type.value=test3;
		    	//item_type.selected=true;
		    	item_type.disabled=true;
		    	//item_type.onfocus='initialSelect = selectedIndex;'
		    	//item_type.onchange='selectedIndex = initialSelect;'
		    	//onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'
		    	item_code.value=test4;
		    	item_code.readOnly=true;
		    	item_code.style.outline='none';
		    	item_name.value=test5;
		    	item_name.readOnly=true;
		    	item_name.style.outline='none';
	            }else{
		    		//grid.uncheckAll() ;
		    		var warehouse_name = document.getElementById('warehouse_name');
			    	var lot_no = document.getElementById('lot_no');
			    	var item_type = document.getElementById('item_type');
			    	var item_code = document.getElementById('item_code');
			    	var item_name = document.getElementById('item_name');
			       	//warehousename.innerText="";
		    		warehouse_name.value="";
		    		warehouse_name.readOnly=false;
		    		warehouse_name.style.removeProperty('outline');
		    		lot_no.value="";
		    		lot_no.readOnly=false;
		    		lot_no.style.removeProperty('outline');
		    		item_type.value="";
		    		//item_type.readOnly=enabled;
		    		item_type.disabled=false;
		    		item_code.value="";
		    		item_code.readOnly=false;
		    		item_code.style.removeProperty('outline');
		    		item_name.value="";
		    		item_name.readOnly=false;
		    		item_name.style.removeProperty('outline');

	            }
		    	
		    	
	    	   	});
	    	
	    	//checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
	    	grid.on('uncheck', (ev) => {
	    		var warehouse_name = document.getElementById('warehouse_name');
		    	var lot_no = document.getElementById('lot_no');
		    	var item_type = document.getElementById('item_type');
		    	var item_code = document.getElementById('item_code');
		    	var item_name = document.getElementById('item_name');
		       	//warehousename.innerText="";
	    		warehouse_name.value="";
	    		warehouse_name.readOnly=false;
	    		warehouse_name.style.removeProperty('outline');
	    		lot_no.value="";
	    		lot_no.readOnly=false;
	    		lot_no.style.removeProperty('outline');
	    		item_type.value="";
	    		//item_type.readOnly=enabled;
	    		item_type.disabled=false;
	    		//item_type.style.removeProperty('outline');
	    		item_code.value="";
	    		item_code.readOnly=false;
	    		item_code.style.removeProperty('outline');
	    		item_name.value="";
	    		item_name.readOnly=false;
	    		item_name.style.removeProperty('outline');
	    		
	    	});
	    	
	    	//reset button 리셋 함수 그리드 내에 단일 check 된 데이터 초기화
	    	function uncheck(){
		    		grid.uncheckAll() ;
		    		var warehouse_name = document.getElementById('warehouse_name');
			    	var lot_no = document.getElementById('lot_no');
			    	var item_type = document.getElementById('item_type');
			    	var item_code = document.getElementById('item_code');
			    	var item_name = document.getElementById('item_name');
			       	//warehousename.innerText="";
		    		warehouse_name.value="";
		    		warehouse_name.readOnly=false;
		    		warehouse_name.style.removeProperty('outline');
		    		lot_no.value="";
		    		lot_no.readOnly=false;
		    		lot_no.style.removeProperty('outline');
		    		item_type.value="";
		    		//item_type.readOnly=enabled;
		    		item_type.disabled=false;
		    		item_code.value="";
		    		item_code.readOnly=false;
		    		item_code.style.removeProperty('outline');
		    		item_name.value="";
		    		item_name.readOnly=false;
		    		item_name.style.removeProperty('outline');
	    		
	    		
	    	};
	    	
	    	

	    	  	
	   //전체 데이터 select 데이터(항상보이기)
	//function checkstock(){
		   // make AJAX call to server
	    $.ajax({
	      type:"POST", //요청방식 
	      dataType:"JSON",
	      url: '<%=request.getContextPath()%>/searchAllStock',
	  	      success: function(data) {
	      	 	gridData=data
	    	  	grid.resetData(data)
	    	   	
	    	   	grid.on('editingFinish', function(ev) {
	            const rowKey = ev.rowKey;
	            const columnName = ev.columnName;
	            var updatedData = {};
	            const rowData = grid.getRow(rowKey);
	            console.log('Row data: ', rowData);
	            //alert(rowData);
	            
	            $.ajax({
	                 url: '<%=request.getContextPath()%>/updateStock',
	                 method: 'PATCH',
	                 dataType: 'JSON',
	                 data: JSON.stringify(rowData),
	                 contentType: 'application/json',
	                 success: function(response) {
	                     console.log('Success:', response);
	                 },
	                 error: function(error) {
	                     console.log('Error:', error);
	                 }
	             }); 
	    	   	});
	    	  },
	      error: function(xhr, status, error) {
	        // handle error
	        console.log(error);
	      }
	    });

		   
		   
	//조회버튼 누를 시 가져오는 데이터 리스트  
	function checkStock(){
		//grid.clear();
// $(document).ready(function() {
//   $('#searchBtn').click(function(event) {
// 	  event.preventDefault();

	    // get search parameters
	var warehouse_code = $('#warehouse_code').val();
    var warehouse_name = $('#warehouse_name').val();
    var lot_no = $('#lot_no').val();
    var item_type = $('#item_type').val();
    var item_code = $('#item_code').val();
    var item_name = $('#item_name').val();
	    $.ajax({
		      type:"POST", //요청방식 
		      dataType:"JSON",
		      url: '<%=request.getContextPath()%>/searchWhStock',
		      //contentType: 'application/json',
		      //data: JSON.stringify({
		    	  data: {
		    	  warehouse_code: warehouse_code,
		          warehouse_name: warehouse_name,
		          lot_no: lot_no,
		    	  item_type: item_type,
		          item_code: item_code,
		          item_name: item_name
		    	  },
		        //}),
		  	      success: function(data) {
		  	    	
		      	 	gridData=data
		    	  	grid.resetData(data)
		    	   	
		    	   	grid.on('editingFinish', function(ev) {
		            const rowKey = ev.rowKey;
		            const columnName = ev.columnName;
		            var updatedData = {};
		            const rowData = grid.getRow(rowKey);
		            console.log('Row data: ', rowData);
		            //alert(rowData);
		            
		            $.ajax({
		                 url: '<%=request.getContextPath()%>/updateStock',
		                 method: 'PATCH',
		                 dataType: 'JSON',
		                 data: JSON.stringify(rowData),
		                 //data: {rowData},
		                 contentType: 'application/json',
		                 success: function(response) {
		                     console.log('Success:', response);
		                 },
		                 error: function(error) {
		                     console.log('Error:', error);
		                 }
		             }); 
		    	   	});
		    	  },
		      error: function(xhr, status, error) {
		        // handle error
		        console.log(error);
		      }
		    });
//    		});
// }); 
	};
	    
	//초기화 버튼 더블 클릭시에 그리드 데이터 클리어
	$(document).ready(function() {
	 $('#resetBtn').dblclick(function(event) {
		  event.preventDefault();
		  grid.clear();
	 	});
	 });
	
</script>


<script>
//modal에 띄워지는 grid2

  var body = document.querySelector('body');
  var modal = document.querySelector('.modal');
  var btnOpenPopup = document.querySelector('.btnFas');

	var grid2=null;	 //추가된 부분!!
	function resetCheck() {
	  if (grid2) {
	    grid2.uncheckAll();
	  }
	}
	
	//modal 닫기 함수
	function closeModal() {
		  modal.classList.remove('show');
	         body.style.overflow = 'auto';
		}	
	
	
	
	//modal 안에 grid2의 checkbox 체크된 row데이터 input태그에 찍기
	function applyModal() {
		// grid2가 존재하고 데이터가 있을 때만 이벤트 리스너 등록
		// if (grid2 && grid2.getData().length > 0) {   
		        //modal.classList.toggle('show');
		        //body.style.overflow = 'auto';
	      if (grid2 && grid2.getCheckedRows().length == 1) {
	   	    const checkedRows = grid2.getCheckedRows();
	   	    const warehouse_code = document.getElementById('warehouse_code');
	   	    warehouse_code.value = checkedRows[0].warehouse_code;
	        //alert(warehouse_code.value);
//	         var warehouse_code = document.getElementById('warehouse_code');
//	         var test = rowData.warehouse_code;
//	         warehouse_code.value = test;
	      }else if(grid2 && grid2.getCheckedRows().length > 1){
	    	  const warehouseCodes = [];
	    	  //document.querySelectorAll('input[name=warehouse_code]:checked').forEach((el) => {
	    	    //warehouseCodes.push(el.value);
	    	   grid2.getCheckedRows().forEach(rowData => {
        		warehouseCodes.push(rowData.warehouse_code);
	    	  });
	    	  //const warehouseCodesString = warehouseCodes.join('@N@');// @로 구분된 문자열
	    	  const warehouseCodesString = warehouseCodes.map(code => code.trim()).join('@N@');
	    	  //.map() 메소드는 자바스크립트 배열에서 사용 가능한 메소드 중 하나. 이 메소드는 배열의 모든 요소에 대해 주어진 함수를 호출하고, 그 결과를 새로운 배열로 반환.
	    	  //위 코드에서는 warehouseCodes 배열의 모든 요소에 대해 trim() 함수를 호출하여 문자열 앞뒤 공백을 제거한 후, @N@ 구분자로 연결한 문자열을 생성.
			  //여기서 code는 콜백 함수의 매개변수로서, 현재 배열 요소를 가리키고, 코드 내에서는 이 요소의 문자열 앞뒤 공백을 제거한 후 반환.
	    	  const warehouse_code = document.getElementById('warehouse_code');
	    	  warehouse_code.value = warehouseCodesString; // input 요소에 문자열 할당
	    	  console.log(warehouseCodesString);
	      }   
	      
	         modal.classList.remove('show');
	         body.style.overflow = 'auto';
		   // });
		}	
	

//modal안에 grid2에 찍히는 창고코드, 창고이름 리스트
$(document).ready(function() {
	
	//reset button 리셋 함수 그리드 내에 단일 check 된 데이터 초기화
// 	function resetCheck(){
// 		grid2.uncheckAll();
// 	};

	
  //$('.btn-open-popup').dblclick(function(event) {
  $('.btnFas').dblclick(function(event) {
	  
  
	  event.preventDefault();
	//추가된 부분!!
	  if(grid2){
		  grid2.destroy();
	  }
	  
	var gridData2=[];
  	grid2 = new tui.Grid({
  	el: document.getElementById('modalGrid'),
  	data: gridData2,
  	scrollX: false,
  	scrollY: false,
  	autoWidth: true,
  	rowHeaders: [{
   	   type: 'rowNum',
   	   header: "  ",
   	   width: 50
  	},{type : 'checkbox'}],
  	columns: [
   	 {
    	header: '창고코드',
      	name: 'warehouse_code',
      	sortable: true,
      	align:'center',
      	width:165
    	},
    	{
      	header: '창고명',
      	name: 'warehouse_name',
      	sortable: true,
      	align:'center',
      	width:165
    	}
  	]
	});
  	

$.ajax({
    type:"POST", //요청방식 
    dataType:"JSON",
    url: '<%=request.getContextPath()%>/searchWhList',
	      success: function(data) {
	    	gridData2=data
  	  		grid2.resetData(data)
  	   	
  	  },
    error: function(xhr, status, error) {
      // handle error
      console.log(error);
    }
  });
  
	  //modal 안에 grid 행 checkbox 체크시 row데이터 출력(웹 console에만 출력하는 용도)
		grid2.on('check', function(ev) {
	    const rowKey = ev.rowKey;
	    const columnName = ev.columnName;
	    var updatedData = {};
	    const rowData = grid2.getRow(rowKey);
	    console.log('Row data: ', rowData);
	    console.dir('Row data: ', rowData);
		}); 

	});//double클릭 이벤트 끝
	
});//document.ready끝	


  //modal 띄우기
  btnOpenPopup.addEventListener('dblclick', () => {
    modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
    	body.style.overflow = 'hidden';
    }
  });

  //modal 클릭 이벤트 리스너(modal 밖의 바탕을 누르면 modal 창 닫히는 이벤트 리스너 = 닫기 버튼 생성으로 주석처리)
  
/*   modal.addEventListener('click', (event) => {
    if (event.target === modal) {
      modal.classList.toggle('show');

      if (!modal.classList.contains('show')) {
        body.style.overflow = 'auto';
      }
    }
  }); */

	function whSearch(){
		var warehouse_code = $('#warehouse_code').val();
	    var warehouse_name = $('#warehouse_name').val();
		    $.ajax({
			      type:"POST", //요청방식 
			      dataType:"JSON",
			      url: '<%=request.getContextPath()%>/searchWh',
			      //contentType: 'application/json',
			      //data: JSON.stringify({
			    	  data: {
			    	  warehouse_code: warehouse_code,
			          warehouse_name: warehouse_name
			    	  },
			        //}),
			  	      success: function(data) {
			  	    	
			      	 	gridData2=data
			    	  	grid2.resetData(data)
			    	   	
			    	  },
			      error: function(xhr, status, error) {
			        // handle error
			        console.log(error);
			      }
			    });

  		}

  

  
</script>





<style>
	
		.form-title{
		width : 100px;
		height: 30px;
		color:black;
		font-weight:bold;
 		background-color: #e2e2e2;
/* 		background-color: #828282; */
		border:1px solid #e2e2e2;
		text-align:center;
	/* 	vertical-align: middle; */
		line-height : 30px;
		border-radius:3px;
		display:inline-block;
		}
		
		.form-data{
		width : 200px;
		height: 30px;
/* 		background-color: rgb(230, 242, 255) */
/* 		text-align:center; */
	/* 	vertical-align: middle; */
		line-height : 30px;
		border-radius:3px;
		border:1px solid #e2e2e2;
		display:inline-block;
		}
		
		.btn-open-popup{
		width : 200px;
		height: 30px;
		background-color: rgb(230, 242, 255);
		text-align:left;
	/* 	vertical-align: middle; */
		line-height : 30px;
		border-radius:3px;
		border:1px solid #e2e2e2;
		display:inline-block;
		}
	
	.modal {
	  position: absolute;
	  top: 0;
	  left: 0;
	
	  width: 100%;
	  height: 100%;
	
	  display: none;
	  background-color: rgba(0, 0, 0, 0.4);
	}
	 
	.modal.show {
	  display: block;
	}
	
	#modalGrid {
	position: relative; /* 변경된 부분 */
/* 	  position: absolute; */
	  top: 50%;
	  left: 50%;
	
	  width: 500px;
	  height: 500px;
	
	  padding: 40px;
	
	  text-align: center;
	
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	  transform: translateX(-50%) translateY(-50%);
	}
	
	.modal-wrapper {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	
	
	

  .search_wh .form-title{
    border-radius:3px;
	line-height : 30px;
  }

  .search_wh input[type="text"] {
    border: none;
    outline: none;
    border-radius:3px;
    border:1px solid #e2e2e2;
    line-height : 30px;
	height: 30px;
  }

  .search_wh .fas.fa-search {
/*     margin-right: 4px; */
  }

  .search_wh input[type="text"]#lens_sh {
    margin-left:-0.5px;

  }

  .search_wh input[type="text"].btn-open-popup {
    padding-left: 30px;
    cursor: text;
    margin-left:-3.5px;
	margin-right:5px;
  }
  
  .search_wh input[type="text"].btn-open-popup:focus {
    outline: none;
  }
  
  .search_wh i.fa-search {
    position: absolute;
    left: 5px;
    top: 50%;
    transform: translateY(-50%);
    z-index: 1;
  }
	

#applyBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 300px; /* 버튼 위치 조정 */
}

#resetMdBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 210px; /* 버튼 위치 조정 */
}


#closeBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 120px; /* 버튼 위치 조정 */
}

#whSearchBtn {

}


    #modalSearch {
        display: flex;
        align-items: center;
    }

    #whSearch {
        flex: 1;
        margin: 0;
        padding: 0;
        border-radius: 4px;
    }
    /*
    flex: 1은 Flexbox 레이아웃에서 아이템이 차지하는 공간을 설정하는 속성. 
    Flexbox 레이아웃은 부모 요소에 display: flex 를 지정하여 해당 요소의 자식 요소들을 유연하게 배치할 수 있는 방법.
	flex: 1은 아이템이 자신이 속한 Flexbox 컨테이너의 가로 축을 따라 가득 차도록 설정하는 속성. 
	즉, 아이템의 너비를 자동으로 설정하여 아이템 간 공간을 균등하게 분배하는데 
	이는 부모 요소의 너비가 변할 때 자식 요소들이 자동으로 크기를 조절할 수 있도록 함.
	위 예시 코드에서는 #whSearch 요소에 flex: 1을 적용하여, #whSearch 요소가 남은 공간을 모두 차지하도록 설정. 
	따라서 #whSearch과 #whSearchBtn 요소가 부모 요소 #modalSearch 내에서 똑바로 가로 정렬.
	*/

    #whSearchBtn {
        margin: 0;
        padding: 0;
        height: 28px;
	    width: 60px;
	    font-size: 13px;
	    color: black;
	    border: 1px solid #8c8c8c;
	    border-radius: 4px;
	    bottom: 10px;
    }

	input::placeholder {
	  color: grey;
	  font-style: italic;
	  font-size:5px;
	}
</style>


<body>

<%-- 	<form id=stockSearch name=stockSearch action="<%=request.getContextPath()%>/stockSearch" method="post"> --%>
	<form id=stockSearch name=stockSearch>
<!-- 		<div class=form-title></div><div><input type="text" id="tSearch" name="tSearch" /></div> -->
<!-- 		<input type="submit" value="조회" id="searchStockList"/> -->
		&nbsp;<button type="button" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" onclick="checkStock()"><img src="<%=request.getContextPath()%>/resources\img\stock\lens.png" width="11px"/>&nbsp;&nbsp;조회</button>&nbsp;
<%-- 		&nbsp;<button type="submit" id="searchBtn" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><img src="<%=request.getContextPath()%>/resources\img\stock\lens.png" width="11px"/>&nbsp;&nbsp;조회</button>&nbsp; --%>
<%-- 					<button type="reset" onclick="item_type.disabled=false;" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><img src="<%=request.getContextPath()%>/resources\img\stock\reset.png" width="11px"/>&nbsp;&nbsp;초기화</button> --%>
					<button type="reset" id="resetBtn" onclick="uncheck()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><img src="<%=request.getContextPath()%>/resources\img\stock\reset.png" width="11px"/>&nbsp;&nbsp;초기화</button>

<br/><br/>
<!-- <input type="button" value="창고 검색" style="border:1px solid #e2e2e2;" /> -->
<!-- <div class="form-title" style="display: inline-block;">창고 검색</div> -->
<!-- <div style="display:inline-block; margin:5px; font-size:13px; color:black;"> -->
<!-- <input type="text" class="form-title" value="창고검색" disabled/><input type="text" class="btn-open-popup" id ="warehouse_code" name="warehouse_code" style="background-color: rgb(230, 242, 255);"/></div> -->

<div class="search_wh" style="display:inline-block; margin-left:6px; font-size:13px; color:black;">
  <input type="text" class="form-title" id="lens_sh" value="창고검색" disabled/>
  <span style="position: relative;" class="btnFas">
    <input type="text" class="btn-open-popup" id="warehouse_code" name="warehouse_code" style="background-color: rgb(230, 242, 255);"/>
    <i class='fas fa-search' style="position: absolute; transform: translateY(-50%);"></i>
  </span>
</div>

<!-- 백업 -->
<!-- <div class="search_wh" style="display:inline-block; margin-left:6px; font-size:13px; color:black;"> -->
<!--   <input type="text" class="form-title" value="창고검색" disabled/> -->
<!--   <span style="position: relative;"> -->
<!--     <input type="text" class="btn-open-popup" id="warehouse_code" name="warehouse_code" style="background-color: rgb(230, 242, 255);"/> -->
<!--     <i class='fas fa-search' style="position: absolute; left: 5px; top: 50%; transform: translateY(-50%);"></i> -->
<!--   </span> -->
<!-- </div> -->



<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >창고검색</div><div class="form-data" style="background-color: rgb(230, 242, 255);"><input type="text"  style="border:none; height:25px; width:190px; background-color: rgb(230, 242, 255);"></div></div> -->

<%-- <button type="button" class="form-title" style="background-color: rgb(230, 242, 255);"><img src="<%=request.getContextPath()%>/resources\img\stock\lens.png" width="11px" /><input type="text" class="form-data" id ="" name="" style="background-color: rgb(230, 242, 255);"/></button> --%>



<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="창고이름" disabled/><input type="text" class="form-data" id ="warehouse_name" name="warehouse_name"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >창고명</div><div class="form-data" id ="warehousename"><input type="text"  style="border:none; height:25px; width:190px;" ></div></div> -->
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >창고명</div><div class="form-data" id ="warehousename" contenteditable="true" style="background-color:white; word-wrap:normal; white-space: pre-wrap; width:200px;"></div></div> -->

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="LOT번호" disabled/><input type="text" class="form-data" id ="lot_no" name="lot_no"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >LOT번호</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품목구분" disabled/><select class="form-data" id="item_type" name="item_type">
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >품목구분</div><div class="form-data"><select name="choice" id="choice" style="border:none; height:25px; width:200px;">  -->
    <option value="" 				<c:if test="${choice == ''}">selected</c:if>>--</option>
    <option value="제품" 			<c:if test="${choice == '제품'}">selected</c:if>>제품</option>
    <option value="반제품" 		<c:if test="${choice == '반제품'}">selected</c:if>>반제품</option>
    <option value="원자재" 	<c:if test="${choice == '원자재'}">selected</c:if>>원자재</option>
    <option value="상품" 		<c:if test="${choice == '상품'}">selected</c:if>>상품</option>
    <option value="기타" 			<c:if test="${choice == '기타'}">selected</c:if>>기타</option>
</select></div>

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="ITEM코드" disabled/><input type="text" class="form-data" id ="item_code" name="item_code"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >ITEM코드</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품명" disabled/><input type="text" class="form-data" id ="item_name" name="item_name"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >품명</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->

<!-- <div style="display:inline-block; margin:5px;"><input type="text" class="form-title" value="품번" disabled/><input type="text" class="form-data" id ="" name=""/></div> -->
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >품번</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->
</form>
	<br/>
	<hr/>
<h6 style="color:black; font-weight:bold; font-size:15px;">&nbsp;창고별 재고현황</h6>
	
<div id="grid"></div>


<div class="modal">
  <!-- modal에 grid 띄우기 -->
  <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">
  	<!-- modal창 내 창고코드 & 창고이름 검색 창 및 버튼-->
    <form id="modalSearch" name="modalSearch">
    <input type="text" id="whSearch" name="whSearch" placeholder="창고코드  & 창코이름 입력 후 검색 실행"/>
    <button type="button" id="whSearchBtn" name="whSearchBtn" onclick="whSearch()">검색</button>
    </form>
    <br/>
    
    <!-- modal 창 내에 기능 버튼 추가 -->
    <button type="button" id="applyBtn" onclick="applyModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources\img\stock\apply.png" width="13px"/>&nbsp;&nbsp;적용
    </button>
    
    <button type="reset" id="resetMdBtn" onclick="resetCheck()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources\img\stock\reset.png" width="11px"/>&nbsp;&nbsp;초기화
    </button>
    
    <button type="button" id="closeBtn" onclick="closeModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
      <img src="<%=request.getContextPath()%>/resources\img\stock\ex.png" width="11px"/>&nbsp;&nbsp;닫기
    </button>
  </div>
</div>
  
    
</body>



</html>






>>>>>>> refs/heads/master
