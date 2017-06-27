import websocket
import account_pb2
import script

def on_message(ws, message):
    print(message)

def on_error(ws, error):
    print(error)

def on_close(ws):
    print("### closed ###")

def on_open(ws):
    print("### open ###")
    ws.send("{}")

if __name__ == "__main__":
    ws = websocket.WebSocketApp("ws://10.254.92.1:8085/",
                              on_message = on_message,
                              on_error = on_error,
                              on_close = on_close)
    ws.on_open = on_open
    ws.run_forever()

