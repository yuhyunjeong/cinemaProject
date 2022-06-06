package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QSeatPerformance is a Querydsl query type for SeatPerformance
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QSeatPerformance extends EntityPathBase<SeatPerformance> {

    private static final long serialVersionUID = -1762170073L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QSeatPerformance seatPerformance = new QSeatPerformance("seatPerformance");

    public final BooleanPath isBooked = createBoolean("isBooked");

    public final QSeat seat;

    public final NumberPath<Long> seatPerformanceCode = createNumber("seatPerformanceCode", Long.class);

    public final QTime time;

    public QSeatPerformance(String variable) {
        this(SeatPerformance.class, forVariable(variable), INITS);
    }

    public QSeatPerformance(Path<? extends SeatPerformance> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QSeatPerformance(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QSeatPerformance(PathMetadata metadata, PathInits inits) {
        this(SeatPerformance.class, metadata, inits);
    }

    public QSeatPerformance(Class<? extends SeatPerformance> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.seat = inits.isInitialized("seat") ? new QSeat(forProperty("seat"), inits.get("seat")) : null;
        this.time = inits.isInitialized("time") ? new QTime(forProperty("time"), inits.get("time")) : null;
    }

}

