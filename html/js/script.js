var moneyactuelle = 0;
var dirtymoneyactuelle = 0;
var bankbalanceactuelle = 0;
var jobactuelle = 'police';
$(function(){
    window.addEventListener("message", function(event) {
		var mess = event.data;


		if(typeof mess.initialise !== 'undefined'){
			$('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + mess.money + ' $');
			$('#dirtymoney').html('<img src="icons/dirtymoney.png" style="padding-right: 3px;" height="25" width="35">' + mess.dirtymoney + ' $');
			$('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + mess.bankbalance + ' $');
			$('#job').html('<img src="icons/job.png" style="padding-right: 3px;" height="25" width="35">' + mess.job + '');
			moneyactuelle = mess.money;
			dirtymoneyactuelle = mess.dirtymoneyinfo;
			bankbalanceactuelle = mess.bankbalanceinfo;
			jobactuelle = mess.job;
		}

		if(typeof mess.moneyinfo !== 'undefined'){
			$('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + mess.moneyinfo + ' $');
			moneyactuelle = mess.moneyinfo;
		}

		if(typeof mess.dirtymoneyinfo !== 'undefined'){
			$('#dirtymoney').html('<img src="icons/dirtymoney.png" style="padding-right: 3px;" height="25" width="35">' + mess.dirtymoneyinfo + ' $');
			dirtymoneyactuelle = mess.dirtymoneyinfo;
		}

		if(typeof mess.bankbalanceinfo !== 'undefined'){
			$('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + mess.bankbalanceinfo + ' $');
			bankbalanceactuelle = mess.bankbalanceinfo;
		}
		
		if(typeof mess.jobinfo !== 'undefined'){
			$('#job').html('<img src="icons/job.png" style="padding-right: 3px;" height="25" width="35">' + mess.jobinfo + '');
			jobactuelle = mess.jobinfo;
		}

		if(typeof mess.rmvBankForMoney !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle - mess.rmvBankForMoney);
			moneyactuelle = Math.round(moneyactuelle + mess.rmvBankForMoney);
			$('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + bankbalanceactuelle + ' $');
			$('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + moneyactuelle + ' $');
		}

		if(typeof mess.rmvMoneyForBank !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle + mess.rmvMoneyForBank);
			moneyactuelle = Math.round(moneyactuelle - mess.rmvMoneyForBank);
			$('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + bankbalanceactuelle + ' $');
			$('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + moneyactuelle + ' $');
		}

		if(typeof mess.addBank !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle + mess.addBank);
			$('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + bankbalanceactuelle + ' $');
		}

		if(typeof mess.rmvBank !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle - mess.rmvBank);
			$('#bankbalance').html('<img src="icons/bank.png" style="padding-right: 3px;" height="25" width="35">' + bankbalanceactuelle + ' $');
		}

		if(typeof mess.addDirtyMoney !== 'undefined'){
			dirtymoneyactuelle = Math.round(dirtymoneyactuelle + mess.addDirtyMoney);
			$('#dirtymoney').html('<img src="icons/dirtymoney.png" style="padding-right: 3px;" height="25" width="35">' + dirtymoneyactuelle + ' $');
		}

		if(typeof mess.rmvDirtyMoney !== 'undefined'){
			dirtymoneyactuelle = Math.round(dirtymoneyactuelle - mess.rmvDirtyMoney);
			$('#dirtymoney').html('<img src="icons/dirtymoney.png" style="padding-right: 3px;" height="25" width="35">' + dirtymoneyactuelle + ' $');
		}

		if(typeof mess.addMoney !== 'undefined'){
			$('#addMoney').html('+' + mess.addMoney);
			var newMoney = Math.round(moneyactuelle + mess.addMoney);
			moneyactuelle = newMoney;
			$('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + newMoney + ' $');
			$("#addMoney").fadeIn("slow", function(){
				setTimeout(function(){ 
					$("#addMoney").fadeOut( "slow", function() {
					});
				}, 2000);
  			});
		}

		if(typeof mess.rmvMoney !== 'undefined'){
			$('#rmvMoney').html('-' + mess.rmvMoney);
			var newMoney = Math.round(moneyactuelle - mess.rmvMoney);
			moneyactuelle = newMoney;
			$('#money').html('<img src="icons/money.png" style="padding-right: 3px;" height="25" width="35">' + newMoney + ' $');
			$("#rmvMoney").fadeIn( "slow", function() {
				setTimeout(function(){
					$("#rmvMoney").fadeOut("slow", function() {
					});
				}, 2000);
  			});
		}
    });

});
