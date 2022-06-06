package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QScreen is a Querydsl query type for Screen
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QScreen extends EntityPathBase<Screen> {

    private static final long serialVersionUID = -642677072L;

    public static final QScreen screen = new QScreen("screen");

    public final NumberPath<Integer> screenCode = createNumber("screenCode", Integer.class);

    public final NumberPath<Integer> screenCol = createNumber("screenCol", Integer.class);

    public final StringPath screenName = createString("screenName");

    public final NumberPath<Integer> screenRow = createNumber("screenRow", Integer.class);

    public QScreen(String variable) {
        super(Screen.class, forVariable(variable));
    }

    public QScreen(Path<? extends Screen> path) {
        super(path.getType(), path.getMetadata());
    }

    public QScreen(PathMetadata metadata) {
        super(Screen.class, metadata);
    }

}

