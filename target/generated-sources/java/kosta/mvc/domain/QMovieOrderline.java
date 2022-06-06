package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QMovieOrderline is a Querydsl query type for MovieOrderline
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QMovieOrderline extends EntityPathBase<MovieOrderline> {

    private static final long serialVersionUID = 1507924278L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QMovieOrderline movieOrderline = new QMovieOrderline("movieOrderline");

    public final BooleanPath isWithGift = createBoolean("isWithGift");

    public final NumberPath<Long> movieOrderlineCode = createNumber("movieOrderlineCode", Long.class);

    public final QOrders order;

    public final QSeatPerformance seatPerformance;

    public QMovieOrderline(String variable) {
        this(MovieOrderline.class, forVariable(variable), INITS);
    }

    public QMovieOrderline(Path<? extends MovieOrderline> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QMovieOrderline(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QMovieOrderline(PathMetadata metadata, PathInits inits) {
        this(MovieOrderline.class, metadata, inits);
    }

    public QMovieOrderline(Class<? extends MovieOrderline> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.order = inits.isInitialized("order") ? new QOrders(forProperty("order"), inits.get("order")) : null;
        this.seatPerformance = inits.isInitialized("seatPerformance") ? new QSeatPerformance(forProperty("seatPerformance"), inits.get("seatPerformance")) : null;
    }

}

