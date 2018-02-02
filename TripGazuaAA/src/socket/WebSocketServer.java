package socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/chat")
public class WebSocketServer{
	
	//WebSocketSession : 세션
	private static Set<Session> 
	clients = Collections.synchronizedSet(new HashSet<Session>());
	
	//open(핸드쉐이크)
	@OnOpen
	public void open(Session session)
	throws IOException {
		System.out.println("오픈했음!!");
		
		//새로운 세션 연결했으니까
		//clients라는 Set에 add함
		
		clients.add(session);
		System.out.println("유저수 : " + clients.size());
		
	}
	
	//close(닫음)
	@OnClose
	public void close(Session session)
			throws Exception {
		// 연결끊었기 때문에 삭제
		clients.remove(session);
		System.out.println("유저수 : " + clients.size());
		System.out.println("연결 끊음!");
	}
	
	//error(에러발생)
	@OnError
	public void error(Session session,
						Throwable t)
			throws Exception {
		// 에러발생 때문에 삭제
		clients.remove(session);
		System.out.println("유저수 : " + clients.size());
		System.out.println("에러 발생");
	}
	
	
	//message(메세지받음)
	@OnMessage
	public void message(String msg, 
			Session s) throws Exception {
		
		//클라이언트로 메세지 보냄
		
		//브로드케스팅
		for(Session session : clients) {
			
			session.getBasicRemote().sendText(msg);
			
		}//for end
		
		//session.getBasicRemote().sendText(msg);
		
		
		//msg : 클라이언트로부터 온 메세지
		System.out.println("메세지 옴 : "+msg);
		
	}//message() end

}//WebSocketServer end
