module screen;

import common;
import pixel;

class Screen {
  private TcpSocket _screen_socket;

  this(Address screenAddress) {
    this._screen_socket = new TcpSocket();
    if (screenAddress !is null) {
      try {
        this._screen_socket.connect(screenAddress);
      } catch(Exception e) {
        this._screen_socket.close();
        destroy(this._screen_socket);
        throw e;
      }
      connected = true;
    }
  }

  public {
    string ip;
    ushort port;
    bool connected = false;

    void connect(string screen_ip, ushort screen_port) {
      if (!connected) {
        ip = screen_ip;
        port = screen_port;

        try {
          this._screen_socket.connect(new InternetAddress(ip,port));
        } catch(Exception e) {
          this._screen_socket.close();
          destroy(this._screen_socket);
          throw e;
        }
      }
    }

    void draw(Pixel p) {
      if (p !is null) {
        try {
          this._screen_socket.send(p.toPacketData());
	} catch(Exception e) {
          writeln("couldn't draw: " ~ e.msg);
	}
      }
    } 
  }
}
