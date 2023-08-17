#!/usr/bin/env bash

WC_AUTO_RESTART=${WC_AUTO_RESTART:-no}
FT_AUTO_RESTART=${FT_AUTO_RESTART:-no}
WC_LOG_FILE=${WC_LOG_FILE:-/dev/null}
function wechat() {
    while :
    do
        wechat-start >${WC_LOG_FILE} 2>&1
        case ${WC_AUTO_RESTART} in
        false|no|n|0)
            exit 0
            ;;
        esac
    done
}

function funtool() {
    while :
    do
        funtool-start >${FT_AUTO_RESTART} 2>&1
        case ${FT_AUTO_RESTART} in
        false|no|n|0)
            exit 0
            ;;
        esac
    done
}

/entrypoint.sh &
sleep 5
wechat &

sleep 3
funtool &
wait
