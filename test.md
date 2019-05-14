# 見出し1
## 見出し2
### 見出し3

**太字**

*斜字*

~~削除します~~

***
線を引く

---

* 箇条書き1
* 箇条書き2
  * 箇条書き3
  * 箇条書き4
    * 箇条書き5
    * 箇条書き6
* 箇条書き7
    * 箇条書き8

1. 数字付き1
1. 数字付き2
1. 数字付き3

> 引用
>> 二重引用
>
> 二重引用あとは一つ行空けた方が良いみたい
>


ソースコードも書ける。実行はできない。

【Python】
```python
# コメント
import numpy
import pandas

print('Hello World')
```
【C言語】
```c
// コメント
#include<stdio.h>

int main(){
    printf("Hello World")
}
```

【C++】
```c++
// コメント
#include <iostream>
using namespace std;

int main(void){
    cout << "Hello World" << endl
}
```
CとC++は同じ色付けだね。（そりゃそーか）

---

改行するときはスペース2つ入れる↓

【拡張機能：HTMLやPDFに変換】
http://www.atmarkit.co.jp/ait/articles/1804/27/news034.html

[リンク⇒拡張機能：HTMLやPDFに変換](http://www.atmarkit.co.jp/ait/articles/1804/27/news034.html)



/carrierwave-1.3.1/lib/carrierwave/uploader/callbacks.rb:15:in `with_callbacks'
/carrierwave-1.3.1/lib/carrierwave/uploader/store.rb:65:in `store!'
/carrierwave-1.3.1/lib/carrierwave/mounter.rb:100:in `each'
/carrierwave-1.3.1/lib/carrierwave/mounter.rb:100:in `store!'
/carrierwave-1.3.1/lib/carrierwave/mount.rb:395:in `store_avater!'
/activesupport-5.1.7/lib/active_support/callbacks.rb:413:in `block in make_lambda'
/activesupport-5.1.7/lib/active_support/callbacks.rb:235:in `block in halting_and_conditional'
/activesupport-5.1.7/lib/active_support/callbacks.rb:511:in `block in invoke_after'
/activesupport-5.1.7/lib/active_support/callbacks.rb:511:in `each'
/activesupport-5.1.7/lib/active_support/callbacks.rb:511:in `invoke_after'
/activesupport-5.1.7/lib/active_support/callbacks.rb:132:in `run_callbacks'
/activesupport-5.1.7/lib/active_support/callbacks.rb:827:in `_run_save_callbacks'
/activerecord-5.1.7/lib/active_record/callbacks.rb:340:in `create_or_update'
/activerecord-5.1.7/lib/active_record/persistence.rb:129:in `save'
/activerecord-5.1.7/lib/active_record/validations.rb:44:in `save'
/activerecord-5.1.7/lib/active_record/attribute_methods/dirty.rb:35:in `save'
/activerecord-5.1.7/lib/active_record/transactions.rb:308:in `block (2 levels) in save'
/activerecord-5.1.7/lib/active_record/transactions.rb:384:in `block in with_transaction_returning_status'
/activerecord-5.1.7/lib/active_record/connection_adapters/abstract/database_statements.rb:233:in `transaction'
/activerecord-5.1.7/lib/active_record/transactions.rb:210:in `transaction'
/activerecord-5.1.7/lib/active_record/transactions.rb:381:in `with_transaction_returning_status'
/activerecord-5.1.7/lib/active_record/transactions.rb:308:in `block in save'
/activerecord-5.1.7/lib/active_record/transactions.rb:323:in `rollback_active_record_state!'
/activerecord-5.1.7/lib/active_record/transactions.rb:307:in `save'
/activerecord-5.1.7/lib/active_record/suppressor.rb:42:in `save'
/activerecord-5.1.7/lib/active_record/persistence.rb:282:in `block in update'
/activerecord-5.1.7/lib/active_record/transactions.rb:384:in `block in with_transaction_returning_status'
/activerecord-5.1.7/lib/active_record/connection_adapters/abstract/database_statements.rb:235:in `block in transaction'
/activerecord-5.1.7/lib/active_record/connection_adapters/abstract/transaction.rb:194:in `block in within_new_transaction'
 vendor/ruby-2.5.1/lib/ruby/2.5.0/monitor.rb:226:in `mon_synchronize'
/activerecord-5.1.7/lib/active_record/connection_adapters/abstract/transaction.rb:191:in `within_new_transaction'
/activerecord-5.1.7/lib/active_record/connection_adapters/abstract/database_statements.rb:235:in `transaction'
/activerecord-5.1.7/lib/active_record/transactions.rb:210:in `transaction'
/activerecord-5.1.7/lib/active_record/transactions.rb:381:in `with_transaction_returning_status'
/activerecord-5.1.7/lib/active_record/persistence.rb:280:in `update'
/devise-4.6.2/lib/devise/models/database_authenticatable.rb:101:in `update_with_password'
/devise-4.6.2/app/controllers/devise/registrations_controller.rb:94:in `update_resource'
/devise-4.6.2/app/controllers/devise/registrations_controller.rb:50:in `update'
/actionpack-5.1.7/lib/action_controller/metal/basic_implicit_render.rb:4:in `send_action'
/actionpack-5.1.7/lib/abstract_controller/base.rb:186:in `process_action'
/actionpack-5.1.7/lib/action_controller/metal/rendering.rb:30:in `process_action'
/actionpack-5.1.7/lib/abstract_controller/callbacks.rb:20:in `block in process_action'
/activesupport-5.1.7/lib/active_support/callbacks.rb:131:in `run_callbacks'
/actionpack-5.1.7/lib/abstract_controller/callbacks.rb:19:in `process_action'
/actionpack-5.1.7/lib/action_controller/metal/rescue.rb:20:in `process_action'
/actionpack-5.1.7/lib/action_controller/metal/instrumentation.rb:32:in `block in process_action'
/activesupport-5.1.7/lib/active_support/notifications.rb:166:in `block in instrument'
/activesupport-5.1.7/lib/active_support/notifications/instrumenter.rb:21:in `instrument'
/activesupport-5.1.7/lib/active_support/notifications.rb:166:in `instrument'
/actionpack-5.1.7/lib/action_controller/metal/instrumentation.rb:30:in `process_action'
/actionpack-5.1.7/lib/action_controller/metal/params_wrapper.rb:252:in `process_action'
/activerecord-5.1.7/lib/active_record/railties/controller_runtime.rb:22:in `process_action'
/actionpack-5.1.7/lib/abstract_controller/base.rb:124:in `process'
/actionview-5.1.7/lib/action_view/rendering.rb:30:in `process'
/actionpack-5.1.7/lib/action_controller/metal.rb:189:in `dispatch'
/actionpack-5.1.7/lib/action_controller/metal.rb:253:in `dispatch'
/actionpack-5.1.7/lib/action_dispatch/routing/route_set.rb:49:in `dispatch'
/actionpack-5.1.7/lib/action_dispatch/routing/route_set.rb:31:in `serve'
/actionpack-5.1.7/lib/action_dispatch/routing/mapper.rb:16:in `block in <class:Constraints>'
/actionpack-5.1.7/lib/action_dispatch/routing/mapper.rb:46:in `serve'
/actionpack-5.1.7/lib/action_dispatch/journey/router.rb:50:in `block in serve'
/actionpack-5.1.7/lib/action_dispatch/journey/router.rb:33:in `each'
/actionpack-5.1.7/lib/action_dispatch/journey/router.rb:33:in `serve'
/actionpack-5.1.7/lib/action_dispatch/routing/route_set.rb:844:in `call'
/warden-1.2.8/lib/warden/manager.rb:36:in `block in call'
/warden-1.2.8/lib/warden/manager.rb:34:in `catch'
/warden-1.2.8/lib/warden/manager.rb:34:in `call'
/rack-2.0.7/lib/rack/etag.rb:25:in `call'
/rack-2.0.7/lib/rack/conditional_get.rb:38:in `call'
/rack-2.0.7/lib/rack/head.rb:12:in `call'
/rack-2.0.7/lib/rack/session/abstract/id.rb:232:in `context'
/rack-2.0.7/lib/rack/session/abstract/id.rb:226:in `call'
/actionpack-5.1.7/lib/action_dispatch/middleware/cookies.rb:613:in `call'
/actionpack-5.1.7/lib/action_dispatch/middleware/callbacks.rb:26:in `block in call'
/activesupport-5.1.7/lib/active_support/callbacks.rb:97:in `run_callbacks'
/actionpack-5.1.7/lib/action_dispatch/middleware/callbacks.rb:24:in `call'
/actionpack-5.1.7/lib/action_dispatch/middleware/debug_exceptions.rb:59:in `call'
/actionpack-5.1.7/lib/action_dispatch/middleware/show_exceptions.rb:31:in `call'
/railties-5.1.7/lib/rails/rack/logger.rb:36:in `call_app'
/railties-5.1.7/lib/rails/rack/logger.rb:24:in `block in call'
/activesupport-5.1.7/lib/active_support/tagged_logging.rb:69:in `block in tagged'
/activesupport-5.1.7/lib/active_support/tagged_logging.rb:26:in `tagged'
/activesupport-5.1.7/lib/active_support/tagged_logging.rb:69:in `tagged'
/railties-5.1.7/lib/rails/rack/logger.rb:24:in `call'
/actionpack-5.1.7/lib/action_dispatch/middleware/remote_ip.rb:79:in `call'
/actionpack-5.1.7/lib/action_dispatch/middleware/request_id.rb:25:in `call'
/rack-2.0.7/lib/rack/method_override.rb:22:in `call'
/rack-2.0.7/lib/rack/runtime.rb:22:in `call'
/activesupport-5.1.7/lib/active_support/cache/strategy/local_cache_middleware.rb:27:in `call'
/actionpack-5.1.7/lib/action_dispatch/middleware/executor.rb:12:in `call'
/actionpack-5.1.7/lib/action_dispatch/middleware/static.rb:125:in `call'
/rack-2.0.7/lib/rack/sendfile.rb:111:in `call'
/actionpack-5.1.7/lib/action_dispatch/middleware/ssl.rb:68:in `call'
/railties-5.1.7/lib/rails/engine.rb:522:in `call'
/puma-3.12.1/lib/puma/configuration.rb:227:in `call'
/puma-3.12.1/lib/puma/server.rb:660:in `handle_request'
/puma-3.12.1/lib/puma/server.rb:474:in `process_client'
/puma-3.12.1/lib/puma/server.rb:334:in `block in run'
/puma-3.12.1/lib/puma/thread_pool.rb:135:in `block in spawn_thread'