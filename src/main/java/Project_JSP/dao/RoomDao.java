package Project_JSP.dao;

import java.util.Date;
import java.util.List;

import Project_JSP.dto.Room;

public interface RoomDao {
	public List<Room> selectRoom();
	public Room selectRoomByNum(Room room);
	public int insertRoom(Room room);
	public void updateRoom(Room room);
	public void deleteRoom(Room room);
	public List<Room> selectAvailabilityRoom(String sDate, String eDate);
	public List<Room> selectAvailabilityRoomByRoomNameAndDate(String roomName, String sDate, String eDate);
	public List<Room> selectRoomToReservation(Date sDate, Date eDate, String roomGrade, String roomName, String viewType, String bedType);
	public List<Room> selectRoombyGrade(String roomGrade);
	public List<Room> selectRoombyGradeAndName(String roomGrade, String roomName);
}
