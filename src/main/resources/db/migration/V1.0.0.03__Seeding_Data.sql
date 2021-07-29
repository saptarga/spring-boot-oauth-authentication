-- Seeding Data
insert into s_roles (id, name)
values ('r001', 'staff');

insert into s_roles (id, name)
values ('r002', 'manager');

insert into s_users (id, username, active, id_role)
values ('u001', 'user001', true, 'r001');

insert into s_users (id, username, active, id_role)
values ('u002', 'user002', true, 'r002');

-- password : teststaff
insert into s_users_passwords (id_user, password)
values ('u001', '$2a$10$8AfV.EkFEPh2OpqInI6r9.FT73nYeKe1bU6Lh.iLqOGnvNxDgXgGS');

-- password : testmanager
insert into s_users_passwords (id_user, password)
values ('u002', '$2a$10$RPB/8RrHOPBbUj0iYRy7hu7K2fMKEFIR5Cqb2oGyeKcRFY/sH0.Mi');

insert into s_permissions (id, label, value)
values ('p001', 'Lihat Data Transaksi', 'VIEW_TRANSAKSI');

insert into s_permissions (id, label, value)
values ('p002', 'Edit Data Transaksi', 'EDIT_TRANSAKSI');

insert into s_roles_permissions (id_role, id_permission)
values ('r001', 'p001');

insert into s_roles_permissions (id_role, id_permission)
values ('r002', 'p001');

insert into s_roles_permissions (id_role, id_permission)
values ('r002', 'p002');

-- Seeding Data Oauth
insert into oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri)
values ('clientwebbased', 'belajar', '$2a$10$rk7SKH0KPDnMWVmFPenbt.dWDgkFd5R03GKpCKzwfRr3fNTlNt03G', 'entri_data,review_transaksi,approve_transaksi', 'authorization_code,refresh_token', 'http://localhost:10000/handle-oauth-callback');

insert into oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri)
values ('clientspamobile', 'belajar', '$2a$10$rk7SKH0KPDnMWVmFPenbt.dWDgkFd5R03GKpCKzwfRr3fNTlNt03G', 'read,write,admin', 'implicit', 'http://localhost:10000/handle-oauth-callback');

insert into oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri)
values ('mobileapp', 'belajar', '$2a$10$rk7SKH0KPDnMWVmFPenbt.dWDgkFd5R03GKpCKzwfRr3fNTlNt03G', 'read,write,admin', 'password,refresh_token', 'http://localhost:10000/handle-oauth-callback');

-- password : 123456789
insert into oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri)
values ('cl-app', 'belajar', '$2a$10$l/zchqwnYjy/Ic2z7JR5SuXOcbRBmdWFgvyKT9KSRlZD9RbjIYc26', 'read,write,admin', 'client_credentials,password,refresh_token,authorization_code,implicit', 'http://localhost:10000/handle-oauth-callback');
