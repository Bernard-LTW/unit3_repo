select name from sqlite_master

select * from transactions

select * from accounts

//go through each account and see if the withdraw and deposit match the transactions

select transaction_type, sum(amount) from transactions where account_id = 1 and transaction_type = 'withdraw' or transaction_type = 'deposit' and account_id = 1 group by transaction_type

select transaction_type, sum(amount) from transactions where account_id = 2 and transaction_type = 'withdraw' or transaction_type = 'deposit' and account_id = 2 group by transaction_type

select account_id, sum(case when transaction_type = 'withdraw' then amount else 0 end) as withdraw, sum(case when transaction_type = 'deposit' then amount else 0 end) as deposit from transactions group by account_id

//calculate expected balance

select account_id, sum(case when transaction_type = 'withdraw' then amount else 0 end) as withdraw, sum(case when transaction_type = 'deposit' then amount else 0 end) as deposit, sum(case when transaction_type = 'withdraw' then amount else 0 end) - sum(case when transaction_type = 'deposit' then amount else 0 end) as expected_balance from transactions group by account_id


