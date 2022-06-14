package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QEventBoard is a Querydsl query type for EventBoard
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QEventBoard extends EntityPathBase<EventBoard> {

    private static final long serialVersionUID = 1430790320L;

    public static final QEventBoard eventBoard = new QEventBoard("eventBoard");

    public final NumberPath<Long> bno = createNumber("bno", Long.class);

    public final StringPath eventImg = createString("eventImg");

    public final StringPath eventPath = createString("eventPath");

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final StringPath title = createString("title");

    public QEventBoard(String variable) {
        super(EventBoard.class, forVariable(variable));
    }

    public QEventBoard(Path<? extends EventBoard> path) {
        super(path.getType(), path.getMetadata());
    }

    public QEventBoard(PathMetadata metadata) {
        super(EventBoard.class, metadata);
    }

}

