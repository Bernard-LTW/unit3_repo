select name from sqlite_master;

select * from transactions;

select * from accounts;

select transaction_type, sum(amount) from transactions where account_id = 1 and transaction_type = 'withdraw' or transaction_type = 'deposit' and account_id = 1 group by transaction_type;

select transaction_type, sum(amount) from transactions where account_id = 2 and transaction_type = 'withdraw' or transaction_type = 'deposit' and account_id = 2 group by transaction_type;

select account_id, sum(case when transaction_type = 'withdraw' then amount else 0 end) as withdraw, sum(case when transaction_type = 'deposit' then amount else 0 end) as deposit from transactions group by account_id;

select account_id, sum(case when transaction_type = 'withdraw' then amount else 0 end) as withdraw, sum(case when transaction_type = 'deposit' then amount else 0 end) as deposit, sum(case when transaction_type = 'withdraw' then amount else 0 end) - sum(case when transaction_type = 'deposit' then amount else 0 end) as expected_balance from transactions group by account_id;

select accounts.account_id, accounts.balance, sum(case when transaction_type = 'withdraw' then amount else 0 end) as withdraw, sum(case when transactions.transaction_type = 'deposit' then amount else 0 end) as deposit, sum(case when transactions.transaction_type = 'deposit' then amount else 0 end) - sum(case when transactions.transaction_type = 'withdraw' then amount else 0 end) as expected_balance from transactions inner join accounts on transactions.account_id = accounts.account_id group by accounts.account_id;



select case when total_deposit - total_withdraw != balance then 'bad' else 'good' end as 'Status' , total_deposit, total_withdraw, balance, account_id
from (select sum(amount) as total_deposit, account_id as a_d from transactions where transaction_type = 'deposit' group by account_id),
(select sum(amount) as total_withdraw, account_id as a_w from transactions where transaction_type = 'withdraw' group by account_id),
accounts where a_d = a_w and a_d = accounts.account_id

