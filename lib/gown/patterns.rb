module Gown
  class Patterns

    Timestamp = '(?<date>[[:digit:]]{8})[[:blank:]](?<time>[[:digit:]]{6}\.[[:digit:]]{,3})[[:blank:]]\[[[:digit:]]{1,5}\][[:blank:]]'
    New_Timestamp = '(?<date>[[:digit:]]{4}-[[:digit:]]{1,2}-[[:digit:]]{1,2})[[:blank:]](?<time>[[:digit:]]{2}:[[:digit:]]{2}:[[:digit:]]{2}\.[[:digit:]]{,3})[[:blank:]]\[[[:digit:]]{1,5}\][[:blank:]]'

    KGP_lifecycle = [
      'KGP got keepalive request',
      'KGP got keepalive ack',
      'CMD got KGP last_status_change query',
      'CMD got KGP is_connected query',
      'CMD sent reply [[:digit:]]+',
      'KGP rescheduling timer',
      'KGP connected to server',
      'MAIN connecting to KGP server [[:alnum:]]+\.miso\.saucelabs\.com took [[:digit:]]+ ms',
    ]

    KGP_warnings = [
      'KGP warning: no keepalive ack for > 5s',       
      'KGP warning: time since last keepalive has exceeded maximum allowed timelimit',
      'KGP warning: the last keepalive ack was received [[:digit:]]+ seconds ago',
    ]

    KGP_metadata = [
      'KGP -> announcement metadata=\{"username"\: "[[:alnum:]]+", "access_key"\: "([[:alnum:]]|-|\*)+"\}',
      'KGP <- announcement [[:digit:]]+ bytes, metadata: \{"last_seen_seq": [[:digit:]]+\}', 
    ]

    KGP_traffic = [
      'KGP (new packet|-> packet|<-|-> keepalive ack|-> keepalive|-> resend)? conn=[[:digit:]]{1,} seq=[[:digit:]]{1,} ack=[[:digit:]]{1,} ctrl=[[:digit:]]{1,} len=[[:digit:]]{1,}',
      'KGP got packet [[:digit:]]+ bytes',
      'KGP -> close conn=[[:digit:]]{1,} seq=[[:digit:]]{1,} ack=[[:digit:]]{1,} ctrl=[[:digit:]]{1,} half=[[:digit:]]+',
      'KGP packet [[:digit:]]+ \<= [[:digit:]]+, removing from cache',
      'KGP got close for conn=[[:digit:]]+',
    ]

    CHANNEL_events = [
      'CHANNEL (<-|->) [[:digit:]]+ (read|sent) [[:digit:]]+ bytes',
      'CHANNEL [[:digit:]]+ connected to ext server',
    ]

    MAIN_lifecycle = [
      'MAIN using socket [[:digit:]]+ for connection',
      'MAIN client event loop exiting: [[:digit:]]+',
      'MAIN main loop exited, return code: [[:digit:]]+',
      'MAIN starting client event loop',
      'MAIN connecting to [[:alnum:]]+\.miso\.saucelabs\.com\:443 via ([[:alnum:]]|/|\.|\?|&|=|-|_|:|%|,){1,}:[[:digit:]]{1,5}',
    ]
  end
end